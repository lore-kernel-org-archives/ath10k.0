Return-Path: <SRS0=gRR+=G6=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91342C433E0
	for <ath10k@archiver.kernel.org>; Wed, 27 Jan 2021 10:52:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D0D12070E
	for <ath10k@archiver.kernel.org>; Wed, 27 Jan 2021 10:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D0D12070E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ao0gNcbtvnhQTxAoboqoeOelhHse1trEQUnNJZ6U2jU=; b=w0PHnnG/K12REDply562v/MYm
	lMaay10VB2bivGaJffmisG6yV7XbKvOxN50NINUIqWyfPqE6i4kDE4wO/qehXra4WG4+7acwrsGTt
	+9JRg8FXpDkyGYmjsMDPKsyhImZCMuO1ygypo850NhjwPG/iWwlKu9p4mSnMm5Ev1XA4WhQWrn8QV
	7TqFcFEsvdfAk7ZxXD8vBr0TdvpJ00O76wykTbQthf2hauK7UIZ+7MSAmiARZKxHjPaCOJyLlLOk3
	M7M3sibR5UoLeTRSdqW9xkS/yCqVUTNszWnU2oa3LqHJIhZu83jpivktn7WigvrgHuUce8R+NtDx3
	qvI3Ydd4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4iR5-0002Mp-LA; Wed, 27 Jan 2021 10:52:31 +0000
Received: from m42-8.mailgun.net ([69.72.42.8])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4iR1-0002MU-HE
 for ath10k@lists.infradead.org; Wed, 27 Jan 2021 10:52:29 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611744748; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=rBiihP6+F2Nl1TLFZAkb7W8YaoxT5anAu7c/558qnQg=;
 b=xcSz4ewiNBpNBGVGqKFJcG6mBLpTj4F6g+n1di16zVg/q1GffBmhuVsi1QS77G4fL5Q8MbiA
 SHG1Ut2N7QaKwJB2zFVwevH/S/E7VuyGq25xrMwz07cXebVOS2Hp+9ZzmQf4jdA/TCXuACb4
 AEnmPXVptkxtWs6SCwqVLfw72mg=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 601145e0d75e1218e3a1aade (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Jan 2021 10:52:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 37737C43462; Wed, 27 Jan 2021 10:52:15 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 44E0FC433CA;
 Wed, 27 Jan 2021 10:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 44E0FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [ath6kl:pending 10/12] drivers/net/wireless/ath/ath10k/mac.c:3010
 ath10k_mac_set_sar_specs() warn: this array is probably non-NULL.
 'sar->sub_specs'
References: <20210122150728.GS2696@kadam>
Date: Wed, 27 Jan 2021 12:52:09 +0200
In-Reply-To: <20210122150728.GS2696@kadam> (Dan Carpenter's message of "Fri,
 22 Jan 2021 18:07:28 +0300")
Message-ID: <871re6abza.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_055228_532608_9C206683 
X-CRM114-Status: GOOD (  13.61  )
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

Dan Carpenter <dan.carpenter@oracle.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   13112a10a90ece17774a25bc363a7561c26aa19f
> commit: c995c0bdf2d68ce279507a2017e1e65e823339df [10/12] ath10k: allow
> dynamic SAR power limits via common API
> config: x86_64-randconfig-m001-20210121 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> New smatch warnings:
> drivers/net/wireless/ath/ath10k/mac.c:3010 ath10k_mac_set_sar_specs()
> warn: this array is probably non-NULL. 'sar->sub_specs'
>
> Old smatch warnings:
> drivers/net/wireless/ath/ath10k/mac.c:5150 ath10k_start() warn:
> missing error code 'ret'
> drivers/net/wireless/ath/ath10k/mac.c:5589 ath10k_add_interface()
> warn: missing error code 'ret'
>
> vim +3010 drivers/net/wireless/ath/ath10k/mac.c
>
> c995c0bdf2d68ce Carl Huang 2021-01-18  2993  
> c995c0bdf2d68ce Carl Huang 2021-01-18 2994 static int
> ath10k_mac_set_sar_specs(struct ieee80211_hw *hw,
> c995c0bdf2d68ce Carl Huang 2021-01-18 2995 const struct
> cfg80211_sar_specs *sar)
> c995c0bdf2d68ce Carl Huang 2021-01-18  2996  {
> c995c0bdf2d68ce Carl Huang 2021-01-18 2997 const struct
> cfg80211_sar_sub_specs *sub_specs;
> c995c0bdf2d68ce Carl Huang 2021-01-18  2998  	struct ath10k *ar = hw->priv;
> c995c0bdf2d68ce Carl Huang 2021-01-18  2999  	u32 i;
> c995c0bdf2d68ce Carl Huang 2021-01-18  3000  	int ret;
> c995c0bdf2d68ce Carl Huang 2021-01-18  3001  
> c995c0bdf2d68ce Carl Huang 2021-01-18  3002  	mutex_lock(&ar->conf_mutex);
> c995c0bdf2d68ce Carl Huang 2021-01-18  3003  
> c995c0bdf2d68ce Carl Huang 2021-01-18 3004 if
> (!ar->hw_params.dynamic_sar_support) {
> c995c0bdf2d68ce Carl Huang 2021-01-18  3005  		ret = -EOPNOTSUPP;
> c995c0bdf2d68ce Carl Huang 2021-01-18  3006  		goto error;
> c995c0bdf2d68ce Carl Huang 2021-01-18  3007  	}
> c995c0bdf2d68ce Carl Huang 2021-01-18  3008  
> c995c0bdf2d68ce Carl Huang 2021-01-18 3009 if (!sar || sar->type !=
> NL80211_SAR_TYPE_POWER ||
> c995c0bdf2d68ce Carl Huang 2021-01-18 @3010 sar->num_sub_specs == 0 ||
> !sar->sub_specs) {
>                                                                                ^^^^^^^^^^^^^^^
> You could delete this if you want.  It can't be NULL.

I removed !sar->sub_specs (I hope that's what you meant) in the in the
pending branch, thanks.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
