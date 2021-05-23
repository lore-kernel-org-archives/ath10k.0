Return-Path: <SRS0=Yrnq=KS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8822CC47080
	for <ath10k@archiver.kernel.org>; Sun, 23 May 2021 16:38:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA8EB61175
	for <ath10k@archiver.kernel.org>; Sun, 23 May 2021 16:38:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA8EB61175
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkYlDK8/R6WhrRNMLEdKsN1GoKd1skW5Xs2YA21Ouq8=; b=HkN56soZ+UrYvCSjZZ9cl/aEe2
	3rGyvWDZXKqWWStJcplJxDSYNGxYmjQ6xbyblEz7MpbeWukeisVdm8JUgVuOBRvGxsvPSx5PA+6s7
	Ns8he7YfG9CXTJE3celbU/Qx5f1BwiwIWi2mdxb3i9vDixvSm6wQHi8ICAMPKqAn/5blpSv5mhJ4z
	iCcXBziS8fDYn/DJFhu/xeRbyWuIwzaJXKa+tSWq7W7cpyjVK1d79ablmq/fM0C0ILMDEmNwPVzpP
	C/65Y3MpmY3yLos1MQMdz38cdAEdR0g5YMRf1sGPSn4XcMOtrbmnwJ6yM/pH6xr0ivB6L4zaf4iiI
	K/z1//iw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkr7W-004d2F-Uw; Sun, 23 May 2021 16:38:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkr7R-004d1k-IA
 for ath10k@desiato.infradead.org; Sun, 23 May 2021 16:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=b5T/viWPCtzwp2tjvCbJ79f605uuEnyBCKqNWXtqkf0=; b=rKAJf14QQfnOZu4rGCtzjmvEko
 /1LN+WKlFjv7HFCk4iE2xncIfBLVjb8R5vuZ3G3g8kx6xPvLEkmR93kOKBTT99AWaGgIjsoGGd7J/
 +Yaw0r7sKcyTuVqfODOKcwcz9X1NVkhd5WFEb2FDz9fw019dx9oQacZK+lVIpAjMxbUv3QV3mvh3/
 9zDtCPGR32pSQxgyxkpegs4rh7rT5GNbFZVl6O7m5qwEaOvLtCtqFyqXS59clTsOErHX4q3sZQ9Xv
 gD1bch77Xt3wn2gCLy4xFzNZ5EFTo9S4l0ruRmrIOlHRw/I4rwJSf/ByGJ7bzQQdgxJzjnG9dVUIx
 9uyCf4Mw==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkr7O-000V33-JS
 for ath10k@lists.infradead.org; Sun, 23 May 2021 16:38:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 u4-20020a05600c00c4b02901774b80945cso10060645wmm.3
 for <ath10k@lists.infradead.org>; Sun, 23 May 2021 09:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b5T/viWPCtzwp2tjvCbJ79f605uuEnyBCKqNWXtqkf0=;
 b=Pr/T1f2EznNoFoUznzCsGq6CLB9oMeShL14xJ07SYtqtCheyWNcVyN2fkI1TvJWBxM
 klCYR+rnH9R0c53b4gAPDduQ4kccsFM/CflCmTUJQ0rcAwLURZWrfI0JBhzFEd6F1YrC
 yfSZW3SzhLfWn9IVCdKqHpzkT0POTdRdEMZ0KtUz2WA10dN86pwSCJcPIIQVUA1YMlEa
 wQRvn2YvfQlTac9CV4pD8yDbVnxx6+oalj5mN6D10VHJrjkdKJzoVD7v+QP7TgB5HrSs
 RuGP/6ZCNVXWZwQoq5QgO+z2VimmsRbFVrPEudh9mjXT9APnPHUSs2EEWgETqZRXaucT
 dFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b5T/viWPCtzwp2tjvCbJ79f605uuEnyBCKqNWXtqkf0=;
 b=FiKZ4rNdE3c88KICKRWCliSDjKF9Sz9W+tJLQPVG/i4F/KaTCmSLNHYX5FtU8fS4rd
 BUIh5ZGKiUeTWl9jMHIdYGILspJ00RKUGgWswoykQQqvnCEkfGMN3kfpm69hZYLwg6hp
 Q33kc3ABRLVf3YG2U0tuUI/2l/GkNBJ/rdH4mbH9+/mI6UncwtEZy3kDyzwibSkzcoDV
 aFBqqI3oPd+EM2tT5H5c978Eq314863LFQlWUMzS13NufJ9vcn3RyIcbyW8MCSLEsE+q
 bpyBW+bTbzjPYUzzVQpuFz6ZFolGjb9Ch1ndOllwE3AbTxNOXtQ2FdxiPWBN9uZEw8B9
 VCKg==
X-Gm-Message-State: AOAM531/xq0u+HLgqwsEn1vviEJlDZ8k0sQwPPZfgVp7agGdpk9tUVzY
 UWOJk9OjdVSq9iy/QECzSzA9a/UG9CFCRg==
X-Google-Smtp-Source: ABdhPJyccTA/4vjIObXm1X7E+phQFWgGwq/rpAxgBGjEvxj4nskbzLPmhALjMNrhGU032FnPBNPc8w==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr17086974wmc.114.1621787899943; 
 Sun, 23 May 2021 09:38:19 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 m7sm9465874wrv.35.2021.05.23.09.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 May 2021 09:38:19 -0700 (PDT)
Subject: Re: [ath6kl:pending 16/26]
 drivers/net/wireless/ath/wcn36xx/main.c:1091:23: warning: no previous
 prototype for 'wcn36xx_get_first_vif'
To: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, Kalle Valo <kvalo@codeaurora.org>,
 ath10k@lists.infradead.org
References: <202105232135.GqT7BiXu-lkp@intel.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <f4ed523d-b2c6-556f-b9a0-ae14b431645f@linaro.org>
Date: Sun, 23 May 2021 17:40:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <202105232135.GqT7BiXu-lkp@intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_093822_679409_C42EAAFC 
X-CRM114-Status: GOOD (  17.01  )
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

On 23/05/2021 14:05, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   a9cccebc0c3b91c2e5d2033d11def1e6f7fc74d4
> commit: d1f965c7b4068af9420408f308bcc6206158b658 [16/26] wcn36xx: Run suspend for the first ieee80211_vif
> config: arc-allyesconfig (attached as .config)
> compiler: arceb-elf-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=d1f965c7b4068af9420408f308bcc6206158b658
>          git remote add ath6kl https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
>          git fetch --no-tags ath6kl pending
>          git checkout d1f965c7b4068af9420408f308bcc6206158b658
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arc
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/net/wireless/ath/wcn36xx/main.c:1091:23: warning: no previous prototype for 'wcn36xx_get_first_vif' [-Wmissing-prototypes]
>      1091 | struct ieee80211_vif *wcn36xx_get_first_vif(struct wcn36xx *wcn)
>           |                       ^~~~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/wcn36xx_get_first_vif +1091 drivers/net/wireless/ath/wcn36xx/main.c
> 
>    1090	
>> 1091	struct ieee80211_vif *wcn36xx_get_first_vif(struct wcn36xx *wcn)
>    1092	{
>    1093		struct wcn36xx_vif *tmp;
>    1094		struct ieee80211_vif *vif = NULL;
>    1095	
>    1096		list_for_each_entry(tmp, &wcn->vif_list, list) {
>    1097			vif = wcn36xx_priv_to_vif(tmp);
>    1098			if (vif)
>    1099				break;
>    1100		}
>    1101		return vif;
>    1102	}
>    1103	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

Hi Kalle.

I'll issue a fix for both of these ASAP

---
bod

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
