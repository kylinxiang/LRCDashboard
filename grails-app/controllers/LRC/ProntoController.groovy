package LRC

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.*
import groovy.json.JsonSlurper
import groovy.json.JsonOutput
import idashboard.*

class ProntoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [prontoInstanceList: Pronto.list(params), prontoInstanceTotal: Pronto.count()]
    }

    def create() {
        [prontoInstance: new Pronto(params)]
    }

    def save() {
		System.out.println(params);
        def prontoInstance = new Pronto(params)
        if (!prontoInstance.save(flush: true)) {
            render(view: "create", model: [prontoInstance: prontoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'pronto.label', default: 'Pronto'), prontoInstance.id])
        redirect(action: "show", id: prontoInstance.id)
    }

    def show() {
        def prontoInstance = Pronto.get(params.id)
        if (!prontoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pronto.label', default: 'Pronto'), params.id])
            redirect(action: "list")
            return
        }

        [prontoInstance: prontoInstance]
    }

    def edit() {
        def prontoInstance = Pronto.get(params.id)
        if (!prontoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pronto.label', default: 'Pronto'), params.id])
            redirect(action: "list")
            return
        }

        [prontoInstance: prontoInstance]
    }

    def update() {
        def prontoInstance = Pronto.get(params.id)
        if (!prontoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pronto.label', default: 'Pronto'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (prontoInstance.version > version) {
                prontoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pronto.label', default: 'Pronto')] as Object[],
                          "Another user has updated this Pronto while you were editing")
                render(view: "edit", model: [prontoInstance: prontoInstance])
                return
            }
        }

        prontoInstance.properties = params

        if (!prontoInstance.save(flush: true)) {
            render(view: "edit", model: [prontoInstance: prontoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'pronto.label', default: 'Pronto'), prontoInstance.id])
        redirect(action: "show", id: prontoInstance.id)
    }

    def delete() {
        def prontoInstance = Pronto.get(params.id)
        if (!prontoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pronto.label', default: 'Pronto'), params.id])
            redirect(action: "list")
            return
        }

        try {
            prontoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'pronto.label', default: 'Pronto'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pronto.label', default: 'Pronto'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	def stat() {
		//return stat with json format
		def qt = new QTPronto()

		def remainedPronto =['A','B','C']
		[remainedPronto:remainedPronto]
	}
	//Second page of chart
	def stat2() {
		def chartTypes = ['allCreatedByIV','allCreatedBySW','allOpenBySW','todayCreatedByIV','todayCreatedByLevel','cnnRateByIV','corrAverTimeBySW','corrAverTimeByLevel','verAverTimeByIV','verAverTimeByLevel']
		return [chartTypes:chartTypes]
	}
	
	//Ajax interface to draw standard charts
	def standard(){
		def field = params.type?:'allCreatedByIV'
		def interval = params.interval?:'daily'
		def prontoStatList = ProntoStat.findAll()
		prontoStatList.sort{
			a,b ->
			a.queryDay <=> b.queryDay
		}
		
		def result = [:]
		result['startDay'] = null
		def data = [:]
		if (interval == 'daily'){
			prontoStatList.each{
				revertList(it.getAt(field)).each{k,v->
					data[k]=data[k]?data[k]<<v:[v]
				}
			}
			result['startDay'] = prontoStatList[0].queryDay
			result['data'] = data
		}
		if (interval == 'weekly'){
			Calendar calendar=Calendar.getInstance()
			calendar.setTime(Date.parse('yyyy-MM-dd',prontoStatList[0].queryDay))
			def sum = [:]
			prontoStatList.each{
				revertList(it.getAt(field)).each{k,v->
					sum[k] = 0
				}
			}
			prontoStatList.each{
				revertList(it.getAt(field)).each{k,v->
					if (field == 'todayCreatedByIV' || field == 'todayCreatedByLevel') {//sum 7 days
						if(calendar.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY && it != prontoStatList[-1] ){
							sum[k] = sum[k] + v
						}else{
							sum[k] = sum[k] + v
							data[k] = data[k]?data[k]<<sum[k]:[sum[k]]
							if (!result['startDay']){
								result['startDay'] = calendar.format('yyyy-MM-dd')
							}
							sum[k] = 0
						}
					}else {//select Sunday value
						if(calendar.get(Calendar.DAY_OF_WEEK) == Calendar.SUNDAY || it == prontoStatList[-1]){
							data[k]=data[k]?data[k]<<v:[v]
							if (!result['startDay']){
								result['startDay'] = calendar.format('yyyy-MM-dd')
							}
						}
					}
				}
				calendar.add(Calendar.DATE, 1)
			}
			result['data'] = data
		}
		print result
		render result as JSON
	}
	//Ajax interface to return pronto id list, directly use sql
	def details(){
		
	}
	def prstat() {
		def today = new Date().format("yyyy-MM-dd")
		def result = QTPronto.findByQueryDay(today)?.getStatusList()
		def result2 = QTPronto.findByQueryDay(today)?.getOpenList()
		def result3 = QTPronto.findByQueryDay(today)?.getTotalList()

		def data = ['status':revertList(result),'open':revertList(result2),'total':revertList(result3)]
		render data  as JSON
	}
	
	def revertList(input) {
		def result = []
		def root = new JsonSlurper().parseText(input)
		if( root instanceof Map) {
			print "string has been convered to map"
		}
		root.each{ k,v->
			result << [k,v]
		}
		return result
	}
	
	def prhistory() {
		def qtprList = QTPronto.findAll()
		def xTotal = ''
		def xOpen = ''
		def yTotal = []
		def yOpen = []
		qtprList.sort{
			a,b ->
			a.queryDay <=> b.queryDay
		}
		qtprList.each{
			if (it.total != 0 && xTotal == '' ) {
				xTotal = it.queryDay
			}
			if (it.open != 0 && xOpen == '' ) {
				xOpen = it.queryDay
			}
			if (xOpen != '') {
				yOpen << it.open
			}
			yTotal << it.total
		}
		def result = ['xtotal':xTotal,'xopen': xOpen, 'totalcolumn':yTotal, 'opencolumn':yOpen]
		render result  as JSON
	}

}
