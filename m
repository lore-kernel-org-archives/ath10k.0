Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD562E743C3
	for <ath10k@archiver.kernel.org>; Mon,  2 Oct 2023 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FyfubPEFSOI8uKNCbLOzfn4BlGDFbnpSjNwnqPOtNG0=; b=za2gsxvyb8usz+i7Vskib9QKkK
	lmn2UoXC2cAEVbn4wJNgLjoN0zi2xEvAuLHKBuUfWaHkvvCQs7EpPeGIGYlhqwConDPrAnr8nqrxw
	0UOzjucN6H9wuqxLxemauBGBD8CP7j2/YpgotdDnIEXWntv83ZGxfvM9KXJF3STRe3YFZHWkHgr2A
	S2FJEfEmIL9/Vm2/i0dA+ROKM1d8Z2AGKT8KMbnwdWlomOKK3qlL6f6PBzjWajEzxIi1Ebiplno7E
	1EdZzKEe4o+yAD5Hgeet2KO07r5xr9/TOOcDoW4SiEQjdn21npI1nqsIIWH0YOFkiBCxc8G+TKdMO
	+Z5pZ01w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLUs-00D2so-06;
	Mon, 02 Oct 2023 16:10:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnLUq-00D2sN-0Q
	for ath10k@lists.infradead.org;
	Mon, 02 Oct 2023 16:10:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 392DaJ5q018280;
	Mon, 2 Oct 2023 16:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=T9yCwFrS5AoooxlKBeLdSc8An+tppK1rapyiK3ru7OU=;
 b=HZ3pP6j7Ib+6fTbkOdd8Ly/OEv9HPqy0690lI4jtvxiW25clJXZp+846T/Uz3iu9qHoP
 N1VAVfU0wfzInuSNVCGo4UUw6GxXIsQpRW1Br5T77nJ4pVicOz/4wOSgjyg0y9yhYjj7
 c903k8sL3Sh5f9EAk1K34OoQ+tmVgUBBdsnVxoKAfLR0ArjoixzYgTSKSSbSBW8bE3dM
 kY8YXHvOVs5/sndPD7RsA5I+UMEdiJ0eXwxatpRgGGQjBOurxAC/Ay4jieUrOwwksSsl
 AeI+uNSauNz++7j96MzLdUc4YYmdQxK4ufjMq9HLzeKWvV4mceIbYHnjCinKHJ7eUDYa jQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tebw9c2k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Oct 2023 16:08:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 392G8IMZ026834
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Oct 2023 16:08:18 GMT
Received: from [10.111.179.185] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Mon, 2 Oct
 2023 09:08:16 -0700
Message-ID: <9a65ff82-e6b0-4253-be86-a0962e673bc4@quicinc.com>
Date: Mon, 2 Oct 2023 09:08:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next PATCH 2/4] netdev: make napi_schedule return bool on
 NAPI successful schedule
Content-Language: en-US
To: Christian Marangi <ansuelsmth@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Leon Romanovsky <leon@kernel.org>,
        Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Chris Snook
	<chris.snook@gmail.com>,
        Raju Rangoju <rajur@chelsio.com>,
        Jeroen de Borst
	<jeroendb@google.com>,
        Praveen Kaligineedi <pkaligineedi@google.com>,
        Shailend Chand <shailend@google.com>,
        Douglas Miller
	<dougmill@linux.ibm.com>,
        Nick Child <nnac123@linux.ibm.com>,
        Michael
 Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Haren Myneni
	<haren@linux.ibm.com>,
        Rick Lindsley <ricklind@linux.ibm.com>,
        Dany Madden
	<danymadden@us.ibm.com>,
        Thomas Falcon <tlfalcon@linux.ibm.com>,
        Tariq Toukan
	<tariqt@nvidia.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose
 Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Krzysztof Halasa <khalasa@piap.pl>, Kalle Valo <kvalo@kernel.org>,
        Gregory
 Greenman <gregory.greenman@intel.com>,
        Chandrashekar Devegowda
	<chandrashekar.devegowda@intel.com>,
        Intel Corporation <linuxwwan@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
        Liu Haijun
	<haijun.liu@mediatek.com>,
        M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
        Ricardo Martinez <ricardo.martinez@linux.intel.com>,
        Loic Poulain
	<loic.poulain@linaro.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes
 Berg <johannes@sipsolutions.net>,
        Yuanjun Gong <ruc_gongyuanjun@163.com>, Wei
 Fang <wei.fang@nxp.com>,
        Alex Elder <elder@linaro.org>, Simon Horman
	<horms@kernel.org>,
        Rob Herring <robh@kernel.org>, Bailey Forrest
	<bcf@google.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Junfeng Guo
	<junfeng.guo@intel.com>,
        Ziwei Xiao <ziweixiao@google.com>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Rushil Gupta <rushilg@google.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Yuri
 Karpov <YKarpov@ispras.ru>,
        Zhengchao Shao <shaozhengchao@huawei.com>,
        Andrew
 Lunn <andrew@lunn.ch>, Zheng Zengkai <zhengzengkai@huawei.com>,
        "Rafael J.
 Wysocki" <rafael.j.wysocki@intel.com>,
        Lee Jones <lee@kernel.org>, Dawei Li
	<set_pte_at@outlook.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Berg
	<benjamin.berg@intel.com>,
        Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
        <linux-rdma@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-can@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <ath10k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
 <20231002151023.4054-2-ansuelsmth@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231002151023.4054-2-ansuelsmth@gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hRpdMXFG_4hBbI6LL3wrdVHE5wqVhjxN
X-Proofpoint-GUID: hRpdMXFG_4hBbI6LL3wrdVHE5wqVhjxN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-02_10,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310020123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_091012_177706_65A4B67C 
X-CRM114-Status: GOOD (  19.79  )
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

On 10/2/2023 8:10 AM, Christian Marangi wrote:
> Change napi_schedule to return a bool on NAPI successful schedule. This
> might be useful for some driver to do additional step after a NAPI ahs

nit:s/ahs/has/

> been scheduled.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>   include/linux/netdevice.h | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index 7e520c14eb8c..2bead8e2a14d 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -490,11 +490,18 @@ bool napi_schedule_prep(struct napi_struct *n);
>    *
>    * Schedule NAPI poll routine to be called if it is not already
>    * running.
> + * Return true if we schedule a NAPI or false if not.
> + * Refer to napi_schedule_prep() for additional reason on why
> + * a NAPI might not be scheduled.
>    */
> -static inline void napi_schedule(struct napi_struct *n)
> +static inline bool napi_schedule(struct napi_struct *n)
>   {
> -	if (napi_schedule_prep(n))
> +	if (napi_schedule_prep(n)) {
>   		__napi_schedule(n);
> +		return true;
> +	}
> +
> +	return false;
>   }
>   
>   /**


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
