Return-Path: <SRS0=Yrnq=KS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89EDCC47080
	for <ath10k@archiver.kernel.org>; Sun, 23 May 2021 17:34:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF49861155
	for <ath10k@archiver.kernel.org>; Sun, 23 May 2021 17:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF49861155
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBZSvIuwH/jr5j1sGaYPINSNXqMw8p6EYBQUpTadHcE=; b=jmpW8akYT/3Ow1TYQ0cNO9jX6U
	qP0UfyM11zLR+BIAWoZXQZgz/dbgJ/fBPJy/iirBgOwfRJmbHBdlz1Zj5HnEPtW43LRjbQgR5py04
	cA3sxCrh8SsH1dGujCPsALo7ktdoda5o12bNr+SODSa4Ha4QrbsxMCNV1au88gzd5bPZNzIB5QzJ8
	qojTzFCsPIiQ9lewxgJICaqVYBQD0HZmfL17SzMhd442hqjsdQkktxQo4/xfHmH/GeJPpvAB1O+yJ
	vFEzlhYAdgVtBWoi55x7n11iHbgs5N5sGSH85Uz9sA1dLL22MJe8Cf6sPPmZMZKy32w+yMe/mDXPf
	m9X1zTYQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkryD-004fxF-GW; Sun, 23 May 2021 17:32:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkry9-004fwK-0c
 for ath10k@desiato.infradead.org; Sun, 23 May 2021 17:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uHNKdrR1EilQ8UD81CpkarD5xO3nruSkbR2pn9A2eF4=; b=qbpcRmY7H1liEpel/MEGKyX+oO
 SHoyrm6xBe8hJid7okP30nMcZDovRri7DtKSWNYnbStx3eGd+SZIK6A3dRnwboOsHCCCkeZJNRk2H
 mBL7DjbmKdAkQtaZ73FgB5zCKERGhI0tfiXGuklAG7aZ7rh+bWlxgHY73bd+DoW6UOTX0b9PefjMe
 /xpVBNML+j8DkRUUw2HCmJxJMJJYO0SA5i0wIKrPvJXcpdzj2uAvZyaIQke7Zpg160nptl4ViG4ao
 8UGLEMAx5HrcBljbM4h1Osu/fUC+ww5MVeh5wBDKFqKM/PBzeYH5Ccq9FrlYx6sjuWCoJliEgrodX
 aNnMwD1w==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkry5-000WLq-T1
 for ath10k@lists.infradead.org; Sun, 23 May 2021 17:32:51 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621791167; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=uHNKdrR1EilQ8UD81CpkarD5xO3nruSkbR2pn9A2eF4=;
 b=Yp3r7Z+Bvsf4lShVf/N19dT0HKNPQG4YFvu2zmgsUWGapn2yAaL9Kszf5iZWaCSz2NxoYFAQ
 ES4HBdUYGsRBLnVWME5ojUgj33AK/y6oTfk3KokPn1TgZ0i7eKv5mKPLY60RFQ0wLzV5Aj8C
 I/03RWYjuqNIyPUtU4S8OVZ31qE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60aa91bc5f788b52a5cf6876 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 23 May 2021 17:32:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6200AC4338A; Sun, 23 May 2021 17:32:44 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A4ECC433D3;
 Sun, 23 May 2021 17:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3A4ECC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
 ath10k@lists.infradead.org
Subject: Re: [ath6kl:pending 16/26]
 drivers/net/wireless/ath/wcn36xx/main.c:1091:23: warning: no previous
 prototype for 'wcn36xx_get_first_vif'
References: <202105232135.GqT7BiXu-lkp@intel.com>
 <f4ed523d-b2c6-556f-b9a0-ae14b431645f@linaro.org>
Date: Sun, 23 May 2021 20:32:40 +0300
In-Reply-To: <f4ed523d-b2c6-556f-b9a0-ae14b431645f@linaro.org> (Bryan
 O'Donoghue's message of "Sun, 23 May 2021 17:40:02 +0100")
Message-ID: <87im39gxtz.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_103250_031233_7EEE6A9F 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Bryan O'Donoghue <bryan.odonoghue@linaro.org> writes:

> On 23/05/2021 14:05, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
>> head:   a9cccebc0c3b91c2e5d2033d11def1e6f7fc74d4
>> commit: d1f965c7b4068af9420408f308bcc6206158b658 [16/26] wcn36xx:
>> Run suspend for the first ieee80211_vif
>> config: arc-allyesconfig (attached as .config)
>> compiler: arceb-elf-gcc (GCC) 9.3.0
>> reproduce (this is a W=1 build):
>>          wget
>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
>> -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          #
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=d1f965c7b4068af9420408f308bcc6206158b658
>>          git remote add ath6kl
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
>>          git fetch --no-tags ath6kl pending
>>          git checkout d1f965c7b4068af9420408f308bcc6206158b658
>>          # save the attached .config to linux build tree
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arc
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> drivers/net/wireless/ath/wcn36xx/main.c:1091:23: warning: no
>>> previous prototype for 'wcn36xx_get_first_vif'
>>> [-Wmissing-prototypes]
>>      1091 | struct ieee80211_vif *wcn36xx_get_first_vif(struct wcn36xx *wcn)
>>           |                       ^~~~~~~~~~~~~~~~~~~~~
>>
>>
>> vim +/wcn36xx_get_first_vif +1091 drivers/net/wireless/ath/wcn36xx/main.c
>>
>>    1090	
>>> 1091	struct ieee80211_vif *wcn36xx_get_first_vif(struct wcn36xx *wcn)
>>    1092	{
>>    1093		struct wcn36xx_vif *tmp;
>>    1094		struct ieee80211_vif *vif = NULL;
>>    1095	
>>    1096		list_for_each_entry(tmp, &wcn->vif_list, list) {
>>    1097			vif = wcn36xx_priv_to_vif(tmp);
>>    1098			if (vif)
>>    1099				break;
>>    1100		}
>>    1101		return vif;
>>    1102	}
>>    1103	
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>>
>
> Hi Kalle.
>
> I'll issue a fix for both of these ASAP

Oops, your patches were not supposed to be in the pending branch yet as
I saw some conflicts. I suspect my patchwork script has a bug with
handling conflicts.

Also I haven't had a chance to review your patches yet. So it would be
better if you can wait for my review comments, and after I have updated
ath.git master branch you can rebase them.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
