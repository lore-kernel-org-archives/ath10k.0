Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39B7C433F5
	for <ath10k@archiver.kernel.org>; Sat,  8 Oct 2022 20:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Cc:From:Message-ID
	:Date:To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zlS38MSTWA/PzY7J6o65D0nI8Tmw6ileJP51oCV4LuY=; b=O6PbNEsvA3C3iFC3zVqFaYbyxj
	fYSEZYQyvCvyQqbTlaT9mW2YAGNXhNTReVry0s+/dRpwFlP3IDytkJqGgugcKDtFUsv2eLD1t6jA6
	Ao4PJVPsUtZdUHc9yUXaphU6sWyKzVgf2dXWi6P12rf2p8VW5U16KGFdGRwOFVQ6kNiV9CWraBApc
	KMSS4UTXVWZYCVVILOG2cz8dwmNu2eiw+ddyItMjnZ2Uqfcwi2tn5aqpKwUB9dSXmt2alcvyESYV0
	SGGd39mDmfGrS8tH5JqM8rQJLFkvIqPRvxOkIj6hZXltPFQxjB8rMuBODQcG0iN7e2ZZABKc2HO/8
	ZP2GbR0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohGWn-00EBHr-7U; Sat, 08 Oct 2022 20:34:33 +0000
Received: from smtp-out-webmail.u-picardie.fr ([195.83.153.3])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohGWi-00EBGt-Ow
	for ath10k@lists.infradead.org; Sat, 08 Oct 2022 20:34:31 +0000
Received: from passoire-02.vm.u-picardie.fr (passoire-02.vm.u-picardie.fr [10.0.132.142])
	by smtp-out-webmail.u-picardie.fr (Postfix) with ESMTP id 5A4012CBDC;
	Sat,  8 Oct 2022 22:34:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at u-picardie.fr
Received: from smtp.u-picardie.fr ([10.0.132.224])
	by passoire-02.vm.u-picardie.fr (passoire-02.vm.u-picardie.fr [10.0.132.142]) (amavisd-new, port 10048)
	with LMTP id fd7sW2y8IXFy; Sat,  8 Oct 2022 22:34:06 +0200 (CEST)
Received: from horde-ext-02 (horde-ext-02.vm.u-picardie.fr [10.0.132.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: l22106526)
	by smtp.u-picardie.fr (Postfix) with ESMTPSA id B8739722;
	Sat,  8 Oct 2022 22:34:04 +0200 (CEST)
Received: from [199.119.235.153] ([199.119.235.153]) by
 webmail.etud.u-picardie.fr (Horde Framework) with HTTP; Sat, 08 Oct 2022
 22:34:04 +0200
Date: Sat, 08 Oct 2022 22:33:54 +0200
Message-ID: <20221008223354.Horde.Es7J81BUNZnvj9HYL2P25SY@webmail.etud.u-picardie.fr>
From: "St. Thomas' Hospital" <henri.lutz@etud.u-picardie.fr>
Cc: tasnimhoffman4985@gmail.com, zubairmeadows45623@gmail.com,
	nikolashardin346@gmail.com, melaniecompton15964@gmail.com,
	martagonzalez89712@gmail.com, ameliagrimes23958@gmail.com,
	avamaimair2356@gmail.com, billpennington692038@gmail.com,
	emilsantos23958@gmail.com, leanneleech30958@gmail.com,
	lennondawe4356@gmail.com, a.jkhbdcecoejjb@demosite.center,
	gokulites_attingal@gokulampublicschool.com,
	mendozae@vaporbombzvegas.com, sharylnusomilxm@yahoo.com,
	rosalvaheffrenxqkf@yahoo.com, zgch@zoporn.com,
	cholemellowlunchroom.e@www.telecom.uu.ru,
	b.r.ea.kab.leactorgiganticp.rofiter@cenovis.the-m.co.kr,
	3ej.u.dyquny.uteng.kengop.enfuyuxen@telecom.uu.ru,
	n.5.103@kaniv.info, contact@vshost.ro, cert@cert.br,
	mail-abuse@cert.br, m.e.s84.9.83@demo.hostforx.com,
	my.ria.d.i.t.tr@yuctw.com,
	gree.dyministergreedyministere.r@www.airchoice.co.kr,
	p.lo.si.v.edhq.gsilvia.woodw.o.r.t.h@sampo.ru,
	i.nsult.i.ngp.a.t.l@www.club-bourse.com,
	ui.ncassidayas@www.iamsport.org,
	ssidyiii.blogspot.comwilliam.cassidy@ironstrategic.com,
	w.d.r.if.t.q.b.v.n@proandpro.it, mohdwaquar.icec@mail.mv-tourist.de,
	w.d.r.if.t.q.b.v.n@winnetkatravel.com, o.v.erg.xl.q.o@arvay.hu,
	a.st.r.olog.ytemr@ecosvit.org,
	p.a.r.a.ju.mp.e.r.sj.a.s.s.en20.14@kosmonautika.info,
	smi.t.hwangqingpenglongxunqu.n@www.sentina.it,
	ju.li.et.br.a.y.226.8@mmedia01.cineca.it,
	yds.g.524.87.59.68.4@bfwatch.barcampbank.org,
	m.et.e.ori.te.ojip@blasch-architekten.de,
	st.or.age.eem.o@qos-web6.exigo.ch, v.a.cci.na.t.e.d.h.j.l@arvay.hu,
	gailbe.yerlein@www.studioalt.ru, ex.p.lo.si.v.edhq.g@arvay.hu,
	fri.e.dabrya.n.5.103@www.gitme.net, office@karateklub-sensei.org.rs,
	sportskiklubsensei@gmail.com, contact@womanzdorovie.ru,
	edithdean@drypipe.com, info@dajoko.com,
	webmaster@sikhgurdwarageneva.ch, lorenavirgil@vaulker.com,
	louis@jakkals-paljas.com, coc@codeofchina.com,
	leo@a.mustdoindubai.com, emily.tillyard@kids24.co.kr,
	20h.ab.i.ta.ty.a.tp@www.your-hoster.de,
	meehanbernhardt333e@yahoo.com,
	i.s.o.n.t.a.r.t.m.a.s.s.e.r.r.d.e.e@www.telecom.uu.ru,
	zakaz@reklamall.ru, kinhdoanh02vuongquocson.vn@gmail.com,
	daotaotesterpro@gmail.com, support@theleagueonline.org,
	ermineartcom@gab.com, yanivcohena1@gmail.com,
	fanbridge@convertkit.com, support@sextoyscatalog.com,
	mail.prozak@gmail.com, swapcrypto2021@gmail.com,
	heathnoyes@gmail.com, porfiriooliveira@gmail.com,
	gladysmccready@freenet.de, art_ashton@gmail.com,
	philipclose@gawab.com, louannethielen@gmail.com, doragreco@gmail.com,
	ilana_nicoll@gmail.com, june.stoker@gmail.com,
	margaritamcrae@gmail.com, mark.orta@gmx.de, hollysheffield@gmail.com,
	trena_southee@gmx.net, clintalford@hotmail.com,
	douglasneace@t-online.de, ashleetull@gmail.com,
	felicia_kesteven@gmail.com, ermacohn@gawab.com,
	evonneahmed@gmail.com, julietawaite@t-online.de,
	vickeyblackwelder@internet-e-mail.com, lorriemattison@gmail.com,
	terrell_holbrook@gmail.com, sherlynschoenberg@gmail.com,
	emiliaroth@gmail.com, lenora.feint@gawab.com,
	ramiroallnutt@bigstring.com, shirleyladner@freenet.de,
	romeocottrell@gmail.com, admin@nua.in.ua, account@smartiptv.host,
	info@sewallhouse.com, silvia.woodw.o.r.t.h@idiving.de,
	angelwolf958@yahoo.com, livingfaith27023@gmail.com,
	40i.n.t.e.rloca.l.qs.j.y@cenovis.the-m.co.kr,
	o.rcu.pineoxs.a@srv5.cineteck.net, iccakorea@gmail.com,
	natalya_1806@mail.ru, info@cplegalconsulting.com,
	lamhoang.edu.vn@gmail.com, info@technicoss.com,
	webmaster@anastore.com, sales@gloextracts.org, dcdurwlk@qjcuveii.com,
	owijwgty@uysjbghb.com, rkkelvv@gmail.com, jjlwnguc@omgeqbry.com,
	pyjli@gmail.com, zgiaqlws@skfhptfy.com, zjkgjgmj@jucwblex.com,
	ygssjwjt@lfglkpts.com, jhibptkx@bmlambbu.com, ron@masonintheusa.net,
	info@bip38.ru, mail@kitabi.ru, info@kmpdc.go.ke,
	team@airplane-pictures.net, goodhealthcare64@gmail.com,
	francis01@frankev.com, info@kenhowardpi.com, rd.j@h.att.ie,
	t.qbv.n@whois.netseoul.com, brenton.copeley@nsreg.com,
	c.o.nne.c.t.0atn.tu@go.o.gle.email, 0atrew.e.r@hu.fe.ng,
	meng.0aluc.h.e.n.4@hu.fe.ng, silvia.woodw.o.r.t.h@h.0aatt.ie,
	0ajfhjhjhjfdgh@sybbr3er.eces.si, c.o.nne.c.t.tn.tu@g0ao.o.gle.email,
	e.0ar@hu.fe.ng, x.p.a.0ark.e@ex.p.lo.si,
	0awles.s.p.a.n.e.r.e.e@hu.fe.ng, e@fuyuancj.com,
	a.jkhbdcecoejjb@icr-amu.cnrs.fr, webmaster@droneenabled.com,
	johndoe@exapmle.com, hickorytaproom@gmail.com,
	info@sales-engineering.org, seo@simplesales.top,
	insta_oil@icloud.com, auto-stage@ya.ru,
	pinkermanaugarten3e@yahoo.com,
	l.u.f.e.ngk.uan.gni.ubi.xn-.u.k.3@econom.uu.ru,
	divinakalathasauqn@yahoo.com, corvet5326@aol.com, ytdrdn@gmail.com,
	info@legalvlogger.com, info@knoxsports.com, help@fumehqd.com,
	vapetrex247@gmail.com, hlocus@bdfllc.com, webmaster@englishbaby.com,
	trina@se7enbites.com, info@se7enbites.com, mellowmoodpipes@gmail.com,
	3pco.ourwebpicvip.comn.3@www.telecom.uu.ru,
	pr.o.p.os.alsc.vh@klein-putz.net, info@weddingplannersatwork.nl,
	bodymadekorea@gmail.com, g.oog.l.eemail.2.1@bubuche93.free.fr,
	www.sex@facebook.uk, yds.g.524.87.59.68.4@lirs.basnet.by,
	www.sageonsail@cenovis.the-m.co.kr, webmaster@sitelord.com,
	admin@techclad.com, drsam@activelifechiro.net,
	support@thevoguechoice.com, bagornobagthelabel@gmail.com,
	zakaz@sb-vnedr.ru, ask@dvlotterygreencard.com,
	webmaster@tadpolekids.in, sales@tahaautogroup.co.nz,
	carsremoval@gmail.com, support@luckyammostore.com,
	info@maylambanh.org, kuliahalislam@gmail.com,
	info@equranplatform.com, reply@equranplatform.com,
	admin@equranplatform.com, tpvlaubisa@gmail.com, laubisa@laubisa.es,
	info@mnbooking.com, charlottecottongimfslt@yahoo.com,
	i.s.o.n.t.a.r.t.m.a.s.s.e.r.r.d.e.e@kraftzone.tk,
	dailytokenews@gmail.com,
	rin.e.morgan823@www.xn--hq1b37iutl0qb06cj1iura767c.kr,
	841@1.twowebmail.top, 212@1.twowebmail.top, ugkpcblyud@rambler.ru,
	celoslot@gmail.com, yuuoop@gmail.com, oppiu@gmail.com,
	oppoppp@gmail.com, 1@pg-slot.game, ggoogg@gmail.com,
	formatchplicmar1976@vx.yandexx.info, mathiaslucy@quelbroker.com,
	adrianneschuler@nbv.toddard.com, dinaault1060@0815.ru,
	j.u.ry.ozer@gmail.com, madelaine-wallis41@nex4.ir,
	erikakushner34@fall.ceako.com, shielajani@quelbroker.com,
	tuyet_scarf@1cryptodarkmarket.com, darryl.hupp@1cryptodarkmarket.com,
	olejacobi1179@iservmail.com, swenezra@dasemana.com,
	leasanto@dasemana.com, frances.van@1cryptodarkmarket.com,
	shang@b-dros.online, rileylehunte@vcr.webolowitz.com,
	karla.lafferty87@1cryptodarkmarket.com,
	dellawindham@art.blurelizer.com, ester@razore100.fans,
	mordkes@gmail.com, andy.considen53@onie60.browndecorationlights.com,
	chelsiemurrayiv1079@mailcase.email, minervaomer@econgate.com,
	priscilla.barfield@next4.ir, imaniboylev1048@iservmail.com,
	jamesonpowlowski824@iservmail.com, eugene.purin@yandex.com,
	tashenevserg@rambler.ru, vickiestracke1713@mailcase.email,
	breanaschulist1693@mailcase.email, annispercy@dasemana.com,
	adrianne_magnuson38@lastmail.info, zelmaleesa@dasemana.com,
	zoraralph@savedaday.com, bernadine.ruse81@1cryptodarkmarket.com,
	mseffiestrosini1603@mailcase.email, averygottschalk11@the.bekkr.com,
	lovky.drocher@yandex.com, emmetmccullough484@mailcase.email,
	graciethompson1040@mailcase.email, rashadschmitt1040@mailcase.email,
	arturoleibowitz99@shout.verywd.com, christinaanus@yandex.by,
	gregorzh.psheksky@yandex.ru, alexander.chistoplotniy@yandex.by,
	coraborer28@mailcase.email, andrew.petrov01@yandex.com,
	creatpeceme1978@ag.rambleri.com, facrabona1988@ca.rambleri.com,
	profrandyschmidt614@mailcase.email,
	alexander.chistoplotniy@yandex.ru, ginoheriberto@dasemana.com,
	israelbarrows1902@mailcase.email, keeleysuttor83@pull.nedmr.com,
	alkivyadparshutkin@rambler.ru, eugene.purin@yandex.kz,
	lupalenkoarainiya@rambler.ru, abdulajanscheglovitov@rambler.ru,
	brynna@menterprise.app, hook@ctcables.com,
	hiryakovalyudovika@rambler.ru, laurelxavier@econgate.com,
	ronnydon@dasemana.com, aline@visagency.online,
	jermainejones1295@mailcase.email, emilytaylah@smilietoys.com,
	stormyhector@quelbroker.com, lake@safekiosk.com,
	lupeschmitt@streamboost.xyz, jett.kaye49@nex4.ir,
	lo.ci.a.nob.o.r.g@gmail.com, cristinevalarie@savedaday.com,
	kayleen@electricscooter.town, giachambliss7@rural.swegu.com,
	uitnivlasova@rambler.ru, maximhhjksah@yandex.com,
	annetttommie@smilietoys.com, amethyste.goudissard91@eskimoz.xyz,
	kristianjanice@quelbroker.com, ernesta.bersezio69@eskimoz.xyz,
	velmawunsch1796@mailcase.email, jaxweb@kramulous.ru,
	randgate99y6@free-private-mail.com,
	jodie.scroggins64@onie60.browndecorationlights.com,
	rumsuchenjo35@free-private-mail.com,
	inhoudryk9c@free-private-mail.com, charmaine@customketodiet.kitchen,
	erwin.holcomb53@da1.gemmasmith.co.uk, daisey@electricscooter.bar,
	carmineelvira@savedaday.com, samjana@smilietoys.com,
	katriceronda@econgate.com, jacquelinebernice@quelbroker.com,
	maksimpn55k@free-private-mail.com, trinamaple@smilietoys.com,
	info@expressmail-mersali.com, support@skodin.com,
	icwordtiredplane.s.j.a.d.e.d.i.m.p.u@www.studioalt.ru,
	ea.dmeekey.e.s.f.e.e.b.l.e.e.e.r.g.d@www.velomarkt.ch,
	i.nsult.i.ngp.a.t.l@zanecarnarvon.blogspot.com,
	dollie.tallent@www.denverprovidence.org,
	p.a.ra.j.umpe.r.sj.a.sse.n201.4@canoaclubmilano.it,
	bre.ak.d.o.wnkq.pz@www.jeffheotzler.com, juliacmarsh99@gmail.com,
	mosvsgt4ntja@gmail.com, lucillerieck8586@yahoo.com,
	stich.olemello.w.l.u.n.c.h.r.o.o.m.e@www.denverprovidence.org,
	remusjackson2010@gmail.com, tyreenrock@gmail.com,
	i.s.a.be.lm.ar.an.t.s.a.le.u.k@yuctw.com,
	bernicesantiago27@yahoo.com, henrietta.mclaughlin@s.dk,
	f.h.is.adfh.as.d.544.654587@n.oc.no, x.p.a.rk.e@domek24.com.pl,
	ene@php.sonne-cie.de, chester.longoria@ecosvit.org,
	v.n@winnetkatravel.com, asex.y.52.1@agroservice.hu,
	lisaa52324@yahoo.com, jmuzamilirshad@gmail.com,
	simplisti.cholemellowlunchroom.e@www.privatemagazine.net,
	joneskeya@gmail.com, khayreewells43@yahoo.com,
	nikhil.patel@yuctw.com,
	c.anoj.ze.d40i.n.t.e.rloca.l.qs.j.y@www.club-bourse.com,
	y576.9@je.an.ne, salina24p-165@yahoo.com, diamondsophia179@gmail.com,
	acacia.grothues@gmail.com, sf.edfwrfe23wdswadsf@www.iate89.ru,
	meng.luc.h.e.n.4@hu.fe.ng, 3eapp.are.ntf.yn.q@www.klein-putz.net,
	7@e.xped.it.io, 3bco.n.s.u.m.erb.b.ek@www.grandhotelnizza.it,
	n.s.u.m.erb.b.ek@www.grandhotelnizza.it,
	c.d.o.w.e.ll2.56.6.340burton.rene0a@www25.tok2.com,
	www.ryterna.ruco.n.s.u.m.erb.b.ek@www.grandhotelnizza.it,
	www.www.hildred.ibbott@cenovis.the-m.co.kr,
	p.r.os.p.e.r.les.c@pezedium.free.fr, support@secureserver.net,
	webmaster@provenessentialoil.com, agencia@bestmodelos.com.mx,
	admin@pistis.com.ng, ben@spielideen.eu, matkinhphamgia@gmail.com,
	info@schluesseldienst-in-duesseldorf.de, typecalendar@gmail.com,
	nshospitality@vip.sina.com, s.attwood@utoronto.ca,
	m.o.l.d.yzak.v@demosite.center, a.d.di.t.i.v.e.c.fox@gul.ly,
	www.jerseygirlcooks@gul.ly, example@hostmail.com,
	business@houseofpakistan.com, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	regressions@lists.linux.dev, konyaliyiz.net@gmail.com,
	duduyao@hotvoice.com, jlapw@r10.net, nbizboostup@gmail.com,
	info@perfectweight.site, info@firearmsarena.com,
	kontakt@instruktornaukijazdy.pl, feedbackform@make-success.com,
	inspire@brookhouseuk.com, sales@alimentosgrole.mx, help@blended.app,
	sales@suresignalsolution.co.uk, avardavat@gmail.com,
	yabam0505@gmail.com, yourmail@yourdomain.com,
	j.u.dy.quny.ut.engkengopenfuyuxen@jatlb.com, a.t.l@www.servertel.kr,
	h.g.h.g.uhytgfrewsdfrg.yh.uijukouh@rndschool61.org.ru,
	info@puregreatdanes.com, beatricejerde1040@uiscape.com,
	info@999plumber.co.uk, info@gloxyvital.com,
	drrosemaryhessel1213@uiscape.com, jaimespinka1756@uiscape.com,
	sales@ibogaplanet.com, mundoarrumado@gmail.com,
	hyundaidededede@gmail.com, o.r.t.h@eco.s.y.st, e.mkaes@alina.hu,
	lauriep@midtec.org, ninopippa@gmail.com,
	info@247drainagesolutions.co.uk, duarte@yahoo.com,
	riello859@hotmail.com, ask@mirbezviz.com, samaharatii@gmail.com,
	support@noxidsoft.com,
	w.pertcpm.comle.ig.hm.art.i.n.e4.1.1@ns.km1003.keymachine.de,
	pb@jonbekk.no, jhj@jonbekk.no, psicologoalcorcon@gmail.com,
	worldcruiseacademyjkt@gmail.com, psicologosanse@gmail.com,
	therivuseliesaabs.com@gmail.com, info@mailhana.com,
	webmaster@thevos.jp, poorpichlerim@yahoo.com, hello7021486@mailed.ro,
	ra.k.e.strow@demosite.center, info@artik.com,
	frances.spinfilelnamesdat@tangshuai.com, sh.a.d.owa.jti@level-one.ru,
	jesus.burrowes@studioalt.ru, info@tsionalawfirm.gr,
	3eatlas.monaxikoslykos@www.bausch.kr,
	fhe.4.5.gfs.jte@blog.ww.ksac.co, l.a.y.e.r.k.m.jq@codersit.co.kr,
	1285574370@qq.com, root@vultr.dev,
	wa.l.r.u.scv.kd@www.testschamp.com,
	jxd7.89j.l.dv.sn.g.5.9s.s.b.22@yuctw.com,
	h.a.i.zi.min.ga.t.xi.mi.n.gs@lodeonline.home.blog, 30171491@qq.com,
	gu.dinhofofinho@lodeonlineme.tumblr.com,
	m.arshal.xqa.c@jobcons.co.kr, v.edhq.g@www.club-bourse.com,
	1207542352@qq.com,
	www.bausch.kr-atlas.monaxikoslykos@cenovis.the-m.co.kr,
	l.i.n.al.aws.on.01.7.5@kcns.kr, t.y.sdaq@ecosvit.org,
	info@advancedupholstery.co.uk, info@tavus.com.tr,
	info@biltekinhali.com, yo_phytoterra@yahoo.com, gi_mistyest@msn.com,
	br_missiewal@yahoo.com, 19383gienger@hotmail.com,
	gulseven@gulsevenhali.com.tr, br_olliesplace@peoplepc.com,
	gi_nettxwerkx@yahoo.com, co_muslimcongress@canada.com,
	br_msyumyum26@yahoo.com, gi_spencerzhou@mail.com, yo_mrmlbsm@aol.com,
	mi_spiritsnear@yahoo.com, cr_rbraygam@aol.com, br_ryersonic@aol.com,
	gi_munchken0@sbcglobal.net, hi_no_manclature@yahoo.com,
	cr_radkins5@sbcglobal.net, to_mudduck324@yahoo.com,
	mi_rpisto2971@aol.com, sa_nasir786usa@yahoo.com,
	su_mkporter0917@hotmail.com, asu_mrkatz0919@live.com,
	su_smbarnett@cox.net, sa_paidamoyompofu@yahoo.com,
	hi_shantelerenea@yahoo.com, az_mistydew85@yahoo.com, info@latebi.de,
	noor@artnoor.com, info@outpto.ru, mail@outpto.com,
	20info@cubeetle.com, info@cubeetle.com, info@iwebhosting.uk,
	strongtieinsuranceca@outlook.com,
	administration@globalenglishtrack.com, drolusolutionhome@gmail.com,
	shelleymacleay@gmail.com, support@intoyments.com,
	office@green-shirts.com, hass@zeeni.com, gd@zeeni.com,
	sales@zeeni.com, info@virtual-office-us.com,
	info@virtualofficeus.com, shaymarrufo@wildmail.com,
	marilynhinds@aol.com, noahstralia@aol.com, adriene_brault@gmail.com,
	nicholmetzger@aol.com, maya_westbury@web.de, celindafreud@inbox.com,
	jedlarsen@yahoo.com, chloecoronado@the-fastest.net,
	williemaefrederic@gmail.com, jamesetter@gmail.com,
	doylekuefer@mailmight.com, archie.roberge@web.de,
	ilabutlin@inbox.com, dorthea.heaney@gawab.com, rainatalbott@aol.com,
	ameliabostic@freenet.de, jodyarispe@yahoo.de, rolandoamos@hotmail.de,
	info@usachannel.info, garrett@scan.me, omris@glancingweb.com,
	how-to-flush-fl-9370@pages.plusgoogle.com,
	jo.hnsdfsdff.dsgdsgdshdghsdhdhfd@r.eces.si,
	arith.met.ic.rucz@tmjambitions.co.uk,
	y71j.u.dyquny.uteng.kengop.enfuyuxen@telecom.uu.ru,
	cover.andrew.meyer@www.telecom.uu.ru, porcupine.oxsa@freeble.co.kr,
	info@alwaleedhouse.com, alwaleedhouse@gmail.com,
	lh.ottartmassflawles.s.p.a.n.e.r.e.e@hu.fe.ng, e@lzweihua.com,
	f.r.a.g.ra.nc.e.rnmn@www.scrc.co.kr,
	bryce.hoffmann@brewcitymusic.com,
	1flisbk8upnraktp4vcbhmjpm0@group.calendar.google.com,
	cafeverdecdmx@gmail.com, mylyn.cuisine@gmail.com,
	janeschmidpvs@yahoo.com, ingridrosiakesvs@yahoo.com,
	yerbarniclefxiu@yahoo.com, andy@fomyn.com,
	informator@all-volgograd.ru, ericcorrea@gawab.com,
	jeffryquilty@yahoo.com, carmeloburing@hotmail.de,
	reyna.vanraalte@yahoo.com, nellienoguera@aol.com,
	abbey_papst@gmail.com, rodmcguinness@gmail.com,
	vivienburbank@hotmail.de, davis.pina@yahoo.de,
	jonniealicea@gmail.com, levianstey@zoho.com, sam_reese@yahoo.de,
	lateshabroun@gmail.com, theron.polen@wildmail.com,
	shellifelts@arcor.de, jerrellkreider@t-online.de,
	kianvalasquez@t-online.de, francinegarica@bigstring.com,
	pedrobeaty@live.de, barbrabenefield@yahoo.de,
	diamondcitylongan@gmail.com, support@noteflight.com,
	sunny_barbee@freeporncamchat.com,
	nweb.mccarthystreetownsville@gmail.com,
	web.mccarthystreetownsville@gmail.com, kgk@kgk.com.pl,
	ef.gv.w.eafg.v.gb.n.y.j.m.123@www.satchitanandacomunidad.org,
	a.ut.um.nt.b.b.m@www.rssaggregator.com,
	sales@fornapa4003wix24003.com, info@astistudio.ru, an@iworld.com,
	former1@mail.kmsp.com, ltaprpq988@ddpgnvr293.com, amol@amolkute.com,
	info@360dialog.com, anna@egmpjobs.com, odessastimitsyfqv@yahoo.com,
	markitafaceryahc@yahoo.com,
	j.x.d.8225.r.fv.tg.b.42.5tgb.22@www.mczzjd.com,
	mike_schwarz@hotmail.de, sales@bestapplestore.com,
	40n.j.bm.vgtsi.o.ekl.a.9.78.6.32.0@irort.ru,
	m.a.d.rigal.z.v.ds@pickup-jp.com,
	i.n.t.e.rloca.l.qs.j.y@infosituspoker.net, www.zanele@www.ecitv.com,
	www.jennmomoftwomunchkins@infosituspoker.net, mika.bugre@yuctw.com,
	pr.o.mp.t.ly.m.sgl@pollapo.com, success@fogbugz.com,
	info@eshopfirst.com, snlimoservice@gmail.com,
	news-webmaster@google.com, info@teammade.be,
	hallo@motorverzekeringkeerman.be, contact@taichoangvip.link,
	webmaster@realcounterfeitbanknotes.com, info@raptology.com,
	submissions@raptology.com,
	94.u.k.3@www.xn--v20ba78u9xira404pbqce7pvwap69d.kr,
	max.carrasco@www.palbang.net, travisholmes6uvg5@yahoo.com,
	lesleycorazzarfgk@yahoo.com, lavonakridgeojnx@yahoo.com,
	o.rcu.pineoxs.a.pro.wanadoo.fr@srv5.cineteck.net,
	gotgotcarpets@gmail.com, gotcarpets@gmail.com,
	madinasofa@mastodon.cloud, beach.william@bls.gov,
	wiatrowski.william@bls.gov, simpson.hilery@bls.gov,
	litras.marika@bls.gov, nestoriak.nicole@bls.gov, hatch.julie@bls.gov,
	allard.dorinda@bls.gov, carey.patrick@bls.gov, mueller.kirk@bls.gov,
	loewenstein.mark@bls.gov, hill.jeff@bls.gov, cage.rob@bls.gov,
	murphy.bonnie@bls.gov, fleck.susan@bls.gov, garner.thesia@bls.gov,
	eldridge.lucy@bls.gov, stewart.jay@bls.gov,
	ruizdegamboa.nancy@bls.gov, mousa.jay@bls.gov, sibley.jim@bls.gov,
	hallbovee.alexandra@bls.gov, rankin.janet@bls.gov,
	palmer.jason@bls.gov, hirniak.michael@bls.gov,
	rosenlund.chris@bls.gov, liddel.emily@bls.gov, robertson.ken@bls.gov,
	savitsky.terrance@bls.gov, williams.douglas@bls.gov,
	morrison.rebecca@bls.gov, kopp.brandon@bls.gov,
	williams.tony@bls.gov, kohli.amrit@bls.gov, bose.charles@bls.gov,
	oohinfo@bls.gov, webmaster@bls.gov, mwilsondc@aol.com,
	claude-fitzsimmons64@hatgiongphuongnam.info, blsdata_staff@bls.gov,
	pressoffice@bls.gov, ppi-info@bls.gov, oews.helpdesk@bls.gov,
	dddp-sup@bls.gov, k12@bls.gov, clientservices@nbome.org,
	webmaster@aacom.org, aacomasinfo@liaisoncas.com,
	carls.matthew.l@dol.gov, ferro.ariam@dol.gov, slade.mikki.w@dol.gov,
	levenstein.susan.l@dol.gov, ortiz.carlie@dol.gov,
	flowers.jeanette@dol.gov, petchik.daniela.m@dol.gov,
	civilrightscenter@dol.gov, foiarequests@dol.gov,
	blsfoiaservicecenter@bls.gov, support@yp.com, support@thryv.com,
	vote@gsa.gov, info@comphc.org, donotreply@melloncg.com,
	brad@idprojection.com, "med."@rsw.edu.pl, mesheryakova_a_v@mail.ru,
	tshitikov@mail.ru, osokolov@islumk.pl, oligmorozova@gmail.com,
	viktorija-bezruk@rambler.ru, pyhteeva@rambler.ru, i.popovych@ukr.net,
	bksnew@rediffmail.com, bksnew@gmail.com,
	theultimateinamdar@yahoo.co.in, doclfc@ua.fm, "u003emed."@rsw.edu.pl,
	v@mail.ru, support@lettoknow.com, info@downtowndoral.com,
	businesstax@hollywoodfl.org, webmaster@lettoknow.com,
	customersupport@rightmove.co.uk, staff@walkersfh.com,
	info@tqconstructorsinc.com, goldendoodleranch@gmail.com,
	secretariat@parismou.org, editor@palltimes.com,
	bill@amtacshooting.com, kingsleynwankwo94@gmail.com,
	kyleph20@gmail.com, mntaylor@att.net, lkbfleur@comcast.net,
	office@mckeancofair.comcastbiz.net, cuixiaoke@hotmail.com,
	currie_priest@hotmail.com, fourseasonsltc@sbcglobal.net,
	charan@abssafecom.ca, ariseelectric@att.net, victorb@restaite.net,
	saintmar@bellsouth.net, filterelated@gmail.com, nyc@florim.com,
	71514.2573@compuserve.com, techsupport@multiquip.com,
	msdmowt@tstt.net.tt, ccstv@ccsdistrict.org, jmccommon@jscc.edu,
	answers@jscc.edu, editor@nspn.tv, sales@nspn.tv, jobs@nspn.tv,
	lanscherr@aol.com, artsolperm@aol.com, service@imagemaker2002.com,
	address@www.winndixie.com, davidn@baptisthealth.net,
	acramedspa@yahoo.com, info@acramedical.com, feeltheheal@gmail.com,
	massageenvyofaventura@yahoo.com, clinic0269@massageenvy.com,
	massageriospa@aol.com, patti.breckenridge@publix.com,
	accounting@cgcosmetic.com, nadia@sunsetchiropractor.com,
	desimaperfumes@gmail.com, gchernys@payerfusion.com,
	info@payerfusion.com, linda@perfectweight4.me, info@vitalius.com,
	dromiami@aol.com, ncapiro@msn.com, cfo092@cohensfashionoptical.com,
	agyndiagnostic@yahoo.com, info@barbadermatology.com,
	admin@flafootandankle.com, goldenpestservices@gmail.com,
	tiffany@horsehavenranch.org, bookings@shortrentalperth.com,
	adoption@mainecoonrescue.net, info@swissmedical.net,
	selma.aybek@insel.ch, someone@website.com, info@tffpn.org,
	neurostatus-support@usb.ch, neurostatus-uhbs@usb.ch,
	billetterie@imarabe.org, journal@neurology.org,
	ncpjournal@neurology.org, ngjournal@neurology.org,
	nnnjournal@neurology.org,
	neurology-bp-feedback@highwire.stanford.edu,
	neurclinpract-bp-feedback@highwire.stanford.edu,
	nng-bp-feedback@highwire.stanford.edu,
	nnn-bp-feedback@highwire.stanford.edu,
	sarah.carrera@wolterskluwer.com, sharon.ames@wolterskluwer.com,
	michael.obrien@wolterskluwer.com, rtessman@aan.com,
	memberservices@aan.com, jonathan_mink@urmc.rochester.edu,
	permissions@lww.com, translationrights@wolterskluwer.com,
	meredith.edelman@wolterskluwer.com,
	reprintsolutions@wolterskluwer.com,
	monique.mclaughlin@wolterskluwer.com, info@lakeb2b.com,
	customersupport@rediff.co.in, sales@rediff.co.in,
	simone.ruedlin@usb.ch, international@usb.ch,
	privacyoffice@simplyhired.com, info@unispital-basel.ch,
	a.siahposht@mazums.ac.ir, tteishikii@gmail.com,
	abdulajala39@gmail.com, elizabeth.wilson2@bmc.org,
	jintai_yu@fudan.edu.cn, donatomelchionda@ospedaliriunitifoggia.it,
	talal_hindawi@hotmail.com, saltaraqji@gmail.com,
	brian.potter@stjude.org, sandrone.stefano@gmail.com,
	bingwei@stanford.edu, chavdavishal2@gmail.com, nosewor@mcmaster.ca,
	joyce.amezav@gmail.com, john.oconnor@ucd.ie, tim.silk@deakin.edu.au,
	yongliu@bupt.edu.cn, yliu@nlpr.ia.ac.cn, gvavougyios@uth.gr,
	michelle.rosa@ufpe.br, ahmedyazzam@gmail.com,
	szuching.lu@strath.ac.uk, mariz@ccf.org, antonio.strafella@uhn.ca,
	anastassia.mena@mail.utoronto.ca, rbh@chulapd.org, rpahwa@kumc.edu,
	isaacson@parkinsonscenter.org, fpogan01@gunet.georgetown.edu,
	mlew@surgery.usc.edu, maeda@iwate-med.ac.jp,
	taguchik@iwate-med.ac.jp, kiwaoka@iwate-med.ac.jp,
	ytaka@iwate-med.ac.jp, ryotan@iwate-med.ac.jp,
	yuriko@iwate-med.ac.jp, teratak@iwate-med.ac.jp,
	suzuyos@iwate-med.ac.jp, takai@iwate-med.ac.jp,
	kentat@iwate-med.ac.jp, hakasaka@iwate-med.ac.jp,
	nisizuka@iwate-med.ac.jp, oliver.bichsel@usz.ch,
	taniuchi.ryoma.da@mail.hosp.go.jp, zoe.thijs@tcu.edu,
	vconstan@med.uoa.gr, vivekl44@yahoo.com, emilia.gatto@ineba.net,
	marisara.dieppa@utsouthwestern.edu,
	meagen.salinas@utsouthwestern.edu, mrafferty@sralab.org,
	asha@sctimst.ac.in, chlin@ntu.edu.tw, cooperj5@ccf.org,
	robert.krikorian@uc.edu, fokeeffe@svuh.ie, alfonso.fasano@uhn.ca,
	richellesantiano@yahoo.com, tsuboi@cis.fukuoka-u.ac.jp,
	cprd@elsevier.com, ruth_schneider@urmc.rochester.edu,
	ayanoms@ncnp.go.jp, cprao@bcm.edu, biniyam.alemayehu@aau.edu.et,
	jessicagreenwood@gmail.com, ihedinachindukwe@gmail.com,
	zuweiser@usb.ch, patho-medgen-sekretariat@usb.ch,
	support@xyzenterprise.com, sales@xyzenterprise.com,
	ingerf@dharma.org, development@dharma.org, loukas.serafeim@insel.ch,
	ssgenius21@gmail.com, ticketshop@sbb.ch, halbtax@sbb.ch,
	fundservice@sbb.ch, ajayadas.ym@gmail.com,
	nicolas.gninenko@neuro.unibe.ch, janine.buehler@extern.insel.ch,
	samantha.weber@extern.insel.ch, anna.wyss@insel.ch,
	eliane.mueller3@insel.ch, salome.haeuselmann@insel.ch,
	manuela.steinauer@insel.ch, adminmed@edarabia.com,
	press@edarabia.com, pglasson@genolier.net, sales@medicoleads.com,
	ch_info@greatplacetowork.com, leah.martorelli@greatplacetowork.com,
	patrick.mollet@greatplacetowork.com,
	lorena.dagrosa@greatplacetowork.com,
	michael.hermann@greatplacetowork.com,
	larissa.zollinger@greatplacetowork.com,
	cornelia.schaettle@greatplacetowork.com,
	thomas.schneider@greatplacetowork.com,
	nicola.hungerbuehler@greatplacetowork.com,
	christine.meyenhofer@greatplacetowork.com,
	patrice.brun@greatplacetowork.com, chris.greter@greatplacetowork.com,
	ulrike.preissner@greatplacetowork.com,
	julia.viehweider@greatplacetowork.com,
	cedric.luethi@greatplacetowork.com,
	sabou.stocker@greatplacetowork.com, mjennings@phoenixchildrens.com,
	direction@cliniquevalmont.ch, pmortagui@montchoisi.ch,
	admissions@cliniquevalmont.ch, restaurantcotelac@cliniquevalmont.ch,
	rcpvalmont@cliniquevalmont.ch,
	onedarncoolschool@phoenixchildrens.com,
	emilycenter@phoenixchildrens.com, deanna@jhmi.edu,
	sneeracher@swissmedical.net, ncastelli@swissmedical.net,
	efrey@swissmedical.net, info@cliniquevalere.ch, info@beaulieu.ch,
	info@privatkliniksiloah.ch, info@lindberg.ch,
	info@clinicasantanna.ch, info@swissvisio.net,
	info@cliniquegenerale.ch, info@providence.ch,
	info@cliniquevalmont.ch, administration@clinique-montbrillant.ch,
	direction@montchoisi.ch, shautdidier@genolier-innovation.net,
	ameynet@genolier.net, info@eaux-vives.com, info@montchoisi.ch,
	info@pyramide.ch, klinik@rosenklinik.ch, direktion@klinikbethanien.ch
Subject: Job Vacancy
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_133429_162744_B56BBA34 
X-CRM114-Status: UNSURE (   1.44  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: recruitment@gstts-nhs-ukonline.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"; DelSp="Yes"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

ClN0LiBUaG9tYXMnIEhvc3BpdGFsIFVLCgogICBSRUY6IEhSL01FRC0wMDQvMDY5MjMKCgpTdC4g
VGhvbWFzJyBIb3NwaXRhbCBVSyBpcyBhIGxhcmdlIE5IUyB0ZWFjaGluZyBob3NwaXRhbCBpbiBD
ZW50cmFsCkxvbmRvbiwgRW5nbGFuZC4gSXQgaXMgb25lIG9mIHRoZSBpbnN0aXR1dGlvbnMgdGhh
dCBjb21wb3NlIHRoZSBLaW5nJ3MKSGVhbHRoIFBhcnRuZXJzLCBhbiBhY2FkZW1pYyBoZWFsdGgg
c2NpZW5jZSBDZW50ZXIuIEFkbWluaXN0cmF0aXZlbHkKcGFydCBvZiB0aGUgR3V5J3MgYW5kIFN0
IFRob21hcycgTkhTIEZvdW5kYXRpb24gVHJ1c3QsIHRvZ2V0aGVyIHdpdGgKR3V5J3MgSG9zcGl0
YWwgYW5kIEtpbmcncyBDb2xsZWdlIEhvc3BpdGFsLCBpdCBwcm92aWRlcyB0aGUgbG9jYXRpb24K
b2YgdGhlIEtpbmcncyBDb2xsZWdlIExvbmRvbiBHS1QgU2Nob29sIG9mIE1lZGljYWwgRWR1Y2F0
aW9uLgoKCkl0IGlzIHJhbmtlZCBhbW9uZ3N0IHRoZSBiZXN0IFRlbiAoMTApIGhvc3BpdGFscyBp
biB0aGUgVW5pdGVkIEtpbmdkb20Kd2l0aCA4NDAgYmVkcy4gVGhlIGhvc3BpdGFsIGhhcyBwcm92
aWRlZCBoZWFsdGhjYXJlIGZyZWVseSBvciB1bmRlcgpjaGFyaXRhYmxlIGF1c3BpY2VzIHNpbmNl
IHRoZSAxMnRoIGNlbnR1cnkuIEl0IGlzIG9uZSBvZiBMb25kb24ncyBtb3N0CmZhbW91cyBob3Nw
aXRhbHMsIGFzc29jaWF0ZWQgd2l0aCBuYW1lcyBzdWNoIGFzIFNpciBBc3RsZXkgQ29vcGVyLApX
aWxsaWFtIENoZXNlbGRlbiwgRmxvcmVuY2UgTmlnaHRpbmdhbGUsIExpbmRhIFJpY2hhcmRzLCBF
ZG11bmQKTW9udGdvbWVyeSwgQWduZXMgRWxpemFiZXRoIEpvbmVzIGFuZCBTaXIgSGFyb2xkIFJp
ZGxleS4gSXQgaXMgYQpwcm9taW5lbnQgTG9uZG9uIGxhbmRtYXJrIOKAkyBsYXJnZWx5IGR1ZSB0
byBpdHMgbG9jYXRpb24gb24gdGhlCm9wcG9zaXRlIGJhbmsgb2YgdGhlIFJpdmVyIFRoYW1lcyB0
byB0aGUgSG91c2VzIG9mIFBhcmxpYW1lbnQuCgoKVGhlIGxhcmdlc3Qgbm90LWZvci1wcm9maXQg
aGVhbHRoIHN5c3RlbSBpbiB0aGUgd29ybGQsIHdlIHByb3ZpZGUgaGlnaApxdWFsaXR5LCBwZXJz
b25hbGl6ZWQgYW5kIGNvbXBhc3Npb25hdGUgY2FyZSB0byBvdXIgcGF0aWVudHMgdGhyb3VnaApv
dXIgZGVkaWNhdGlvbiB0byBzYWZldHksIHJpZ29yb3VzIHNlbGYtYXNzZXNzbWVudCwgcGVyZm9y
bWFuY2UKaW1wcm92ZW1lbnQsIGNvcnBvcmF0ZSBpbnRlZ3JpdHkgYW5kIGhlYWx0aCBzZXJ2aWNl
IG1hbmFnZW1lbnQuIFdlIGFyZQpjb21taXR0ZWQgdG8gYmVpbmcgdGhlIHBlci1lbWluZW50IHBy
b3ZpZGVyIG9mIGFjdXRlIGlucGF0aWVudCBhbmQKb3V0cGF0aWVudCBoZWFsdGggY2FyZSBzZXJ2
aWNlcy4KCgpERVNDUklQVElPTjogRm9sbG93aW5nIHRoZSBDT1ZJRC0xOSBvdXRicmVhaywgZXhw
YW5zaW9uIGFuZApkZXZlbG9wbWVudCBpbiBvdXIgaG9zcGl0YWwsIHdlIGFyZSBjdXJyZW50bHkg
cmVjcnVpdGluZyBhbmQgZW1wbG95aW5nCnRoZSBzZXJ2aWNlcyBvZiBNZWRpY2FsIFByb2Zlc3Np
b25hbHMgIChTcGVjaWFsaXN0cywgQ29uc3VsdGFudHMsCkdlbmVyYWwgUHJhY3RpdGlvbmVycykg
d2l0aCByZWxldmFudCBleHBlcmllbmNlcyB0byBmaWxsIGluIHRoZQpmb2xsb3dpbmcgYmVsb3cg
dmFjYW5jaWVzIGluIG91ciBoZWFsdGggY2FyZSBmYWNpbGl0eSBpbiB0aGUgVW5pdGVkCktpbmdk
b20uCgoKQVJFQVMgT0YgVkFDQU5DSUVTOgoKClN0SDEuIEFMTEVSR1kgJiBJTU1VTk9MT0dZIFN0
SDIuIEFOQUVTVEhFU0lPTE9HWSBTdEgzLiBBTkdJT0xPR1kgU3RINC4KQU5USFJPUE9TT1BISUMg
TUVESUNJTkUgU3RINS4gQlJFQVNUIFNVUkdFUlkgIFN0SDYuIENBUkRJT0xPR1kgU3RINy4KQ1JB
TklPU0FDUkFMIFBSQUNUSVRJT05FUiAvIFRIRVJBUElTVCBTdEg4LiBDQVJESU9USE9SQUNJQyBT
VVJHRVJZClN0SDkuIENBUkRJQUMgU1VSR0VSWQoKClN0SDEwLiBDUklUSUNBTCBDQVJFIE1FRElD
SU5FIFN0SDExLiBERU5USVNUUyBTdEgxMi4gREVOVEFMIFNVUkdFT04KU3RIMTMuIERFUk1BVE9M
T0dZIFN0SDE0LiBFTkRPQ1JJTk9MT0dZCgoKU3RIMTUuIEVNRVJHRU5DWSBNRURJQ0lORSBTdEgx
Ni4gR0FTVFJPRU5URVJPTE9HWSBTdEgxNy4gR0VORVJBTApTVVJHRVJZIFN0SDE4LiBHRU5FUkFM
IFBBRURJQVRSSUNTICBTdEgxOS4gR0VORVJBTCBNRURJQ0lORSAgU3RIMjAuCkhFTUFUT0xPR1kg
U3RIMjEuIEhZUEVSVEVOU0lPTiBTUEVDSUFMSVNUIFN0SDIyLiBJTlRFUk5BTCBNRURJQ0lORQpT
dEgyMy4gSU5GRUNUT0xPR1kgU3RIMjQuIE1PUlBIT0xPR1kgU3RIMjUuIE5FUEhST0xPR1kgIFN0
SDI2LgpORVVST1NVUkdFUlkgU3RIMjcuIE5FT05BVE9MT0dZIFN0SDI4LiBPUlRIT1BBRURJQ1Mg
U3RIMjkuIE9SVEhPUEFFRElDClNVUkdFUlkgU3RIMzAuIE9UT1JISU5PTEFSWU5HT0xPR1kgIFN0
SDMxLiBPUlRIT0RPTlRJU1QgU3RIMzIuCk9DQ1VQQVRJT05BTCBNRURJQ0lORSBTdEgzMy4gT1JB
TCBBTkQgTUFYSUxMT0ZBQ0lBTCBTVVJHRVJZIFN0SDM0LgpQQVRIT0xPR1kKCgpTdEgzNS4gUExB
U1RJQyAmIFJFQ09OU1RSVUNUSVZFIFNVUkdFUlkgU3RIMzYuIFBORVVNT0xPR1kgU3RIMzcuClBB
RURJQVRSSUMgU1VSR0VPTiAgU3RIMzguICBQU1lDSE9MT0dJU1QgU3RIMzkuICBQSFlTSU9USEVS
QVBZICBTdEg0MC4KUEVESUFUUklDUyBTdEg0MS4gUFVCTElDIEhFQUxUSCAgU3RINDIuIFJBRElP
TE9HWSBTdEg0My4gUkhFVU1BVE9MT0dZClN0SDQ0LiBSRUhBQklMSVRBVElPTiBNRURJQ0lORSBT
dEg0NS4gUkVTUElSQVRPUlkgTUVESUNJTkUgIFN0SDQ2LgpUSE9SQUNJQyBTVVJHRVJZICBTdEg0
Ny4gVFJBVU1BVE9MT0dZIFN0SDQ4LiBUUklDSE9MT0dJU1QgU3RINDkuClVST0xPR1kKCgpKT0Ig
TE9DQVRJT046IExvbmRvbiwgVW5pdGVkIEtpbmdkb20KCkpPQiBDT01NRU5DRU1FTlQ6IDIwMjIK
CkVNUExPWU1FTlQgVFlQRTogQ29udHJhY3QgLyBGdWxsLXRpbWUKCkVNUExPWU1FTlQgQkVORUZJ
VFM6CgoKCkV4Y2VsbGVudCBTYWxhcnkgYW5kIE92ZXJ0aW1lIEJvbnVzLCBIZWFsdGgvbGlmZSBJ
bnN1cmFuY2UsIFJlbG9jYXRpb24KZXhwZW5zZXMsIFJlc2VhcmNoIGFuZCBFZHVjYXRpb25hbCBh
c3Npc3RhbmNlLCBNZWRpY2FsLCBPcHRpY2FsIGFuZApEZW50YWwgQ2FyZSwgRmFtaWx5L1Npbmds
ZSBob3VzaW5nIGFjY29tbW9kYXRpb24sIDI0LzcgT2ZmaWNpYWwKVmVoaWNsZSwgU2Nob2xhcnNo
aXAgZm9yIGVtcGxveWVlJ3MgZGVwZW5kZW50IHdpdGhpbiBVSyBzY2hvb2xzLgoKCkludGVyZXN0
ZWQgYXBwbGljYW50cyBhcmUgdG8gc2VuZCBhIGRldGFpbGVkIHJlc3VtZSB2aWEgZW1haWwKYXR0
YWNobWVudCBhbG9uZyB3aXRoIG1lZGljYWwgZ3JhZHVhdGlvbiBjZXJ0aWZpY2F0ZShzKSB0bzoK
cmVjcnVpdG1lbnRAZ3N0dHMtbmhzLXVrb25saW5lLmNvbQoKCk5PVEU6IEFQUExJQ0FUSU9OIElT
IE9QRU4gVE8gSU5URVJFU1RFRCBQRVJTT05TIEZST00gQUxMIElOVEVSTkFUSU9OQUwKTE9DQVRJ
T05TLCBBTEwgU1VDQ0VTU0ZVTCBBUFBMSUNBTlRTIElOIE9VUiBSRUNSVUlUTUVOVCBQUk9DRVNT
IE1VU1QKQkUgV0lMTElORyBUTyBSRUxPQ0FURSBUTyBUSEUgVUsgRk9SIFdPUksuCgoKQ29yb25h
dmlydXMgKENPVklELTE5KS0gU3RheSBhdCBob21lIGlmIHlvdSBmZWVsIHVud2VsbC4gSWYgeW91
IGhhdmUgYQpmZXZlciwgY291Z2ggYW5kIGRpZmZpY3VsdHkgYnJlYXRoaW5nLCBzZWVrIG1lZGlj
YWwgYXR0ZW50aW9uIGFuZApjYWxsLWluIGFkdmFuY2UuIEZvbGxvdyB0aGUgZGlyZWN0aW9ucyBv
ZiB5b3VyIGxvY2FsIGhlYWx0aCBhdXRob3JpdHkuClNvdXJjZTogV29ybGQgSGVhbHRoIE9yZ2Fu
aXphdGlvbgoKCgpTaW5jZXJlbHksCgoKQWduZXMgQ2FyZGVsbGEsCgpNZWRpY2FsIFJlY3J1aXRt
ZW50IEFzc2lzdGFudAoKCgpTdC4gVGhvbWFzJyBIb3NwaXRhbAoKR3V5J3MgJiBTdC4gVGhvbWFz
IE5IUyBGb3VuZGF0aW9uIFRydXN0CgpMb25kb24sIFVuaXRlZCBLaW5nZG9tIEAyMDIyCgoKU3Qg
VGhvbWFzJyBIb3NwaXRhbCBVSyBpbmNvcnBvcmF0ZWQgaW4gRW5nbGFuZCwgVUsgKFJlZy4gTm86
IDA2MTYwMjY2KQpoYXZpbmcgaXRzIHJlZ2lzdGVyZWQgYWRkcmVzcyBhdCBXZXN0bWluc3RlciBC
cmlkZ2UgUmQsIExvbmRvbiBTRTEKN0VILCBFbmdsYW5kLgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMGsK
