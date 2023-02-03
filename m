Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3BCC05027
	for <ath10k@archiver.kernel.org>; Fri,  3 Feb 2023 21:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ytaWUAamKlNklUtgedcu2Cv7PCwz+/j/PgyntET3pM=; b=q+du9Yi9AGk9mF
	vJuaSNfj1I843F095nr52OeCEEiHa0yhqwLz568zDnpD+hH0Sc9AWoe5rMyKIsDIko+XOkPPO70WV
	nQ/LPMWYPNbGG1P+UAMdDNgMX+2hHBCUhLZ+1nCPjKcbvqBg2YgyM9A406zPwF4gSZmcklCIBlNUj
	0UOmfgjAxm4IQLWktevfI2WSfaqA25k+J1Ao3PzytlT8HWMQDI46FxKNwtK81TaUzZjMmfjrnxXSw
	QBA3ykUaFpLHJi938YrOcWaK0L6FTOhiciwfmSIBzGzem6KaoViSkfrdUobmb60PLmdQDaAFBanpG
	V52VoUzNrMFAXNe0y6dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO42O-003hr1-8Y; Fri, 03 Feb 2023 21:56:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO42J-003hpr-TT; Fri, 03 Feb 2023 21:56:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 313KTSjW025071;
	Fri, 3 Feb 2023 21:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=qcppdkim1; bh=zXDLHevRmbNSieNjjZ1itBUbVMHRS4dQ8ncRciz05CU=;
 b=FnAt2NZyHNV925FRMJKX5HNFpbtGl80xJ5Simzd4dnspOfwMwmJY3Kq/mxJkJYucCcM5
 ZrhNIHiMbmasCmA+UdX35t4SvXC3y//w9S0LXF8zViotoGYqj3OS4TMFPlxLKVWRm2Sb
 S74EUPFZJEbnmYukTsRs75yWT0n1UEAzFeqdEtOGZ0CAjUAusSbb7RlU/C5+zYoWzf+3
 UZBV7FdzQl84NnWUgpDVWIhzXwFgYB3XpHwpHwkrNj+5OcIFqU34wjW5EeP/Ev207PNW
 vV42m8XCBn1squCKUoXdorylZE2Y3lNSWd2RsmFrF00WR+bdSkVYJNCrKSo/35wP8dFA QA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ngw4p9thc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 21:55:35 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 313LtYE4001279
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Feb 2023 21:55:34 GMT
Received: from quicinc.com (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 3 Feb 2023
 13:55:33 -0800
Date: Fri, 3 Feb 2023 13:55:32 -0800
From: Guru Das Srinagesh <quic_gurus@quicinc.com>
To: Elliot Berman <quic_eberman@quicinc.com>
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Russell King
	<linux@armlinux.org.uk>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Daniel
 Lezcano" <daniel.lezcano@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie
	<airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Will Deacon
	<will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel
	<joro@8bytes.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash
 Garodia" <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Alex Elder
	<elder@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Zhang Rui <rui.zhang@intel.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <iommu@lists.linux.dev>,
        <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <ath10k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-scsi@vger.kernel.org>
Subject: Re: [PATCH] firmware: qcom_scm: Move qcom_scm.h to
 include/linux/firmware/qcom/
Message-ID: <20230203215532.GA10258@quicinc.com>
References: <20230203210956.3580811-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230203210956.3580811-1-quic_eberman@quicinc.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IakSQGYsVJaEfb-gAExeEyYclWwLMuK5
X-Proofpoint-ORIG-GUID: IakSQGYsVJaEfb-gAExeEyYclWwLMuK5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_19,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302030197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_135600_112862_15FEDC80 
X-CRM114-Status: GOOD (  12.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Feb 03 2023 13:09, Elliot Berman wrote:
> Move include/linux/qcom_scm.h to include/linux/firmware/qcom/qcom_scm.h.
> This removes 1 of a few remaining Qualcomm-specific headers into a more
> approciate subdirectory under include/.
> 
> Suggested-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>

Reviewed-by: Guru Das Srinagesh <quic_gurus@quicinc.com>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
