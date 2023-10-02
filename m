Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E496E776C5
	for <ath10k@archiver.kernel.org>; Mon,  2 Oct 2023 21:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3BmDeUSMX+U+RvCLXt32Vny15VSXEOk8hcheb2GPYqQ=; b=dUXto5RzPcpf5HzkvVKUAO3rAx
	IL00sBFjsMw+tegISI16xgmkdP6NfySAagF5pCJr2x7QQ5s5eR+rlgTu1kxcXkDiZcRGd/Dx1H0dm
	VNJDtAcOoKK82AfH3e7MLKnDVeS5TFsOahDzECmpPCFhCa8QC9ceMxJgTO5Qlyk5z2JFytEZNYa9F
	16EzDZVcSszrk31pMfw7rPOa0Cvaua41MBB3wR7HU4Trvy6dMvsp3TfCVSzKHXlupaqKNKUNx2au3
	mlVVderz3URPLNMfZguPRx1r7FxBy1Hga+uDKaL9AwylOs2XKE3WsyR4gapOCalMQOQZ+vXyOEX7c
	RnTiCCuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnQg5-00DPuS-1P;
	Mon, 02 Oct 2023 21:42:09 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnQg2-00DPtR-1I;
	Mon, 02 Oct 2023 21:42:07 +0000
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 392Lc35b009233;
	Mon, 2 Oct 2023 21:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=9DoH5Z0FBBn7OOXsdsVMtbrWjPpvQTS37XxZVqX2ya0=;
 b=lxWXuknd3yuLsB86dOCJbRBBlD1v8Gr3EKV5SxMyczpYq9wVkuu9dRTsHmqBPIZEOrxH
 RD5yl7IZRyLRaBM00mbLWa6O6cbBcdU6azN8t6TnT3PDvMgdSBmWA95OCiZUzRMnT1Od
 rDuK07M+9ePTBIr763u/90apwJmDdY1L8gdceYC16fJJY9GDYZ85Nqg0Ch/G1V4h2Z60
 iRaMo6XOEkYreYQBFyDo3oVThvgzs0bjAubGuZ/c0AHqVvxQ4Mq7FBbIldd3qMC/lsHo
 qjIT/lXGdiSENpNgiiQMZRA8yrHTWxQTMCyotLa+Oq306GD7AIKHYwGG6O/qUpRzUthr /w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tg5q109ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Oct 2023 21:41:31 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 392LcTNL009989;
	Mon, 2 Oct 2023 21:41:30 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tg5q109a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Oct 2023 21:41:30 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 392K30kt005924;
	Mon, 2 Oct 2023 21:41:28 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tex0scxuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Oct 2023 21:41:28 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 392LfR6B27001512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Oct 2023 21:41:27 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 866195803F;
	Mon,  2 Oct 2023 21:41:27 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C15A5804E;
	Mon,  2 Oct 2023 21:41:23 +0000 (GMT)
Received: from [9.61.133.200] (unknown [9.61.133.200])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  2 Oct 2023 21:41:23 +0000 (GMT)
Message-ID: <406173de-f215-4719-be69-7789869126a0@linux.ibm.com>
Date: Mon, 2 Oct 2023 16:41:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH 3/4] netdev: replace napi_reschedule with
 napi_schedule
To: Christian Marangi <ansuelsmth@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Chris Snook <chris.snook@gmail.com>,
        Raju Rangoju <rajur@chelsio.com>,
        Jeroen de Borst <jeroendb@google.com>,
        Praveen Kaligineedi <pkaligineedi@google.com>,
        Shailend Chand <shailend@google.com>,
        Douglas Miller
 <dougmill@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Haren Myneni <haren@linux.ibm.com>,
        Rick Lindsley <ricklind@linux.ibm.com>,
        Dany Madden <danymadden@us.ibm.com>,
        Thomas Falcon <tlfalcon@linux.ibm.com>,
        Tariq Toukan <tariqt@nvidia.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Krzysztof Halasa <khalasa@piap.pl>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>,
        Gregory Greenman <gregory.greenman@intel.com>,
        Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
        Intel Corporation <linuxwwan@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
        Liu Haijun <haijun.liu@mediatek.com>,
        M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
        Ricardo Martinez <ricardo.martinez@linux.intel.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Yuanjun Gong <ruc_gongyuanjun@163.com>, Wei Fang <wei.fang@nxp.com>,
        Alex Elder <elder@linaro.org>, Simon Horman <horms@kernel.org>,
        Rob Herring <robh@kernel.org>, Bailey Forrest <bcf@google.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Junfeng Guo <junfeng.guo@intel.com>, Ziwei Xiao <ziweixiao@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rushil Gupta <rushilg@google.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Yuri Karpov <YKarpov@ispras.ru>,
        Zhengchao Shao <shaozhengchao@huawei.com>,
        Andrew Lunn <andrew@lunn.ch>, Zheng Zengkai <zhengzengkai@huawei.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Lee Jones
 <lee@kernel.org>, Dawei Li <set_pte_at@outlook.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Berg
 <benjamin.berg@intel.com>,
        Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
        linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-can@vger.kernel.org, netdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
 <20231002151023.4054-3-ansuelsmth@gmail.com>
Content-Language: en-US
From: Nick Child <nnac123@linux.ibm.com>
In-Reply-To: <20231002151023.4054-3-ansuelsmth@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AFJ5CXgaf9gn3Ls0jloeGnb824w-iwMV
X-Proofpoint-ORIG-GUID: Qz1_8zO7QXXjWE3s-ruwlXCzRrelvADM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-02_15,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1011 impostorscore=0 adultscore=0 mlxlogscore=829 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310020167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_144206_561227_20DC3C04 
X-CRM114-Status: GOOD (  14.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org



On 10/2/23 10:10, Christian Marangi wrote:
> Now that napi_schedule return a bool, we can drop napi_reschedule that
> does the same exact function. The function comes from a very old commit
> bfe13f54f502 ("ibm_emac: Convert to use napi_struct independent of struct
> net_device") and the purpose is actually deprecated in favour of
> different logic.
> 
> Convert every user of napi_reschedule to napi_schedule.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

For
>   drivers/net/ethernet/ibm/ibmveth.c                     |  2 +-
>   drivers/net/ethernet/ibm/ibmvnic.c                     |  2 +-

Acked-by: Nick Child <nnac123@linux.ibm.com>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
