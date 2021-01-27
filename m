Return-Path: <SRS0=gRR+=G6=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9661C433DB
	for <ath10k@archiver.kernel.org>; Wed, 27 Jan 2021 11:01:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A3EF2076D
	for <ath10k@archiver.kernel.org>; Wed, 27 Jan 2021 11:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A3EF2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qbOi8jrwFskfRj+CYwipT+/gu3pV0rCTPNjL2otgL58=; b=NVxqfFkCy838KReuFpNK1zdil
	GTaQD7RH/4gCSXFbWXAL1MtNZxJ1+i+2hANGemf0HenFMrQOFKD0XuhA0lLGnnjINrv7nxLkpfAL0
	f8Dqxx/MOBisV7NLfrHGvsv0Wzy+7J7kKs06/4XY2Ck4WsitpXQ2z9nGG86wyIwQ5AgxUXhSpnt+9
	9b7fUe1dAggT1HwOY43RZQMZcCMKv3h0coqAOnCrhbZdrdLpnpVdYgu+majYpKlr5WMcXW1nUvkk5
	hXENRo23+CFY/BhnbY4VQdoiGv+NVN70v5OpRRkjaTj5MehjM+smneDy9e2+X2Oq9bSyidAg+/rNI
	dCa3zM12g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4iZW-0003cf-3i; Wed, 27 Jan 2021 11:01:14 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4iZS-0002yu-6H
 for ath10k@lists.infradead.org; Wed, 27 Jan 2021 11:01:13 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RArwW6074666;
 Wed, 27 Jan 2021 10:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=7Pd17/IjadRir1zQKLG7aVnZWZjmJSYpBkBauOqwsx8=;
 b=jzfvo8LXySx5y4hZQ5pCxWSFuLEeTLTn/kHOi5g7sJbXrrqXUjZztrDSaPW0ncabZrtn
 MfZixiRMljfSmRHqfeRXPZ+3LPFpvuBfyCSSzyXeG4t+PigswrsVu10jMobJFeXM7X9B
 JBy4hlLDkkCQheebMIq+Tsi2kMcCSKT3Y10C5UQba7o6UobBQVVhdkNoo1zuF6/C8ajv
 bRY1oDu5zfiq1PTL3PIKyPlyUbVJLQJ+tAUQ3+55vUJEs4gsmQfOXM2LkgBcS08l2GTJ
 4qSJQjQVPVNxrH6EIPIo0m/lIAzOIMAso10CuhXjez/ubb4Ri1M/e0keQeKHl63xFN9W iA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 368b7qxgwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 10:58:59 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10RAu98E083685;
 Wed, 27 Jan 2021 10:58:58 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 368wqxpqgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 10:58:58 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10RAwrDV002554;
 Wed, 27 Jan 2021 10:58:56 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 27 Jan 2021 02:58:53 -0800
Date: Wed, 27 Jan 2021 13:58:45 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [ath6kl:pending 10/12]
 drivers/net/wireless/ath/ath10k/mac.c:3010 ath10k_mac_set_sar_specs() warn:
 this array is probably non-NULL. 'sar->sub_specs'
Message-ID: <20210127105845.GR20820@kadam>
References: <20210122150728.GS2696@kadam>
 <871re6abza.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871re6abza.fsf@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9876
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270058
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9876
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_060110_379994_441A0F98 
X-CRM114-Status: GOOD (  22.11  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: Abhishek Kumar <kuabhs@chromium.org>,
 Brian Norris <briannorris@chromium.org>, kbuild-all@lists.01.org,
 lkp@intel.com, kbuild@lists.01.org, Carl Huang <cjhuang@codeaurora.org>,
 ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Wed, Jan 27, 2021 at 12:52:09PM +0200, Kalle Valo wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  pending
> > head:   13112a10a90ece17774a25bc363a7561c26aa19f
> > commit: c995c0bdf2d68ce279507a2017e1e65e823339df [10/12] ath10k: allow
> > dynamic SAR power limits via common API
> > config: x86_64-randconfig-m001-20210121 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > New smatch warnings:
> > drivers/net/wireless/ath/ath10k/mac.c:3010 ath10k_mac_set_sar_specs()
> > warn: this array is probably non-NULL. 'sar->sub_specs'
> >
> > Old smatch warnings:
> > drivers/net/wireless/ath/ath10k/mac.c:5150 ath10k_start() warn:
> > missing error code 'ret'
> > drivers/net/wireless/ath/ath10k/mac.c:5589 ath10k_add_interface()
> > warn: missing error code 'ret'
> >
> > vim +3010 drivers/net/wireless/ath/ath10k/mac.c
> >
> > c995c0bdf2d68ce Carl Huang 2021-01-18  2993  
> > c995c0bdf2d68ce Carl Huang 2021-01-18 2994 static int
> > ath10k_mac_set_sar_specs(struct ieee80211_hw *hw,
> > c995c0bdf2d68ce Carl Huang 2021-01-18 2995 const struct
> > cfg80211_sar_specs *sar)
> > c995c0bdf2d68ce Carl Huang 2021-01-18  2996  {
> > c995c0bdf2d68ce Carl Huang 2021-01-18 2997 const struct
> > cfg80211_sar_sub_specs *sub_specs;
> > c995c0bdf2d68ce Carl Huang 2021-01-18  2998  	struct ath10k *ar = hw->priv;
> > c995c0bdf2d68ce Carl Huang 2021-01-18  2999  	u32 i;
> > c995c0bdf2d68ce Carl Huang 2021-01-18  3000  	int ret;
> > c995c0bdf2d68ce Carl Huang 2021-01-18  3001  
> > c995c0bdf2d68ce Carl Huang 2021-01-18  3002  	mutex_lock(&ar->conf_mutex);
> > c995c0bdf2d68ce Carl Huang 2021-01-18  3003  
> > c995c0bdf2d68ce Carl Huang 2021-01-18 3004 if
> > (!ar->hw_params.dynamic_sar_support) {
> > c995c0bdf2d68ce Carl Huang 2021-01-18  3005  		ret = -EOPNOTSUPP;
> > c995c0bdf2d68ce Carl Huang 2021-01-18  3006  		goto error;
> > c995c0bdf2d68ce Carl Huang 2021-01-18  3007  	}
> > c995c0bdf2d68ce Carl Huang 2021-01-18  3008  
> > c995c0bdf2d68ce Carl Huang 2021-01-18 3009 if (!sar || sar->type !=
> > NL80211_SAR_TYPE_POWER ||
> > c995c0bdf2d68ce Carl Huang 2021-01-18 @3010 sar->num_sub_specs == 0 ||
> > !sar->sub_specs) {
> >                                                                                ^^^^^^^^^^^^^^^
> > You could delete this if you want.  It can't be NULL.
> 
> I removed !sar->sub_specs (I hope that's what you meant) in the in the
> pending branch, thanks.

Yeah.  No need to check.  It's the address of an array and the array is
not the first struct member.  And even ->sub_specs was the first
struct member then we know "sar" is non-NULL so there is no way
sar->sub_specs can be NULL.

regards,
dan carpenter


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
