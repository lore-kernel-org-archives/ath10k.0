Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175A5606A31C
	for <ath10k@archiver.kernel.org>; Thu, 26 Nov 2026 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lda+bTcl;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SfxZnJwX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sup216p3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bdx7UpabDWwudSHqUP7nL1DuePy6rsFlxcZipCI63Tw=; b=lda+bTcl7TVNxp
	8euxDGhWjRvMhtEPVtuK4T4c1ZVOmnyIf2tiawSpRT3cDGz6GVwE9srwA5761TBGvzBlHYCMknxhm
	vbGuBh0hMolZTMhqvSCTtnlnZQcfeMujDk9YPDbfh2zCNOesoskE8CollW6srrta38QNS9HFfS2Kf
	7dtHpmfX+kh1rad/mgwUmo7trIovwFgh6iqdHAAS2sSzC5GkEjoRn/6KW+cFVfsqUmpfKzSNVnqds
	fAMvwviFBHnBgo6Sz8O8CBl5eZpTBiIW0LsgZlApMBrt3QZQ++OJ+KXwrb7OPTLzstjMgZuoDKp9/
	VgVTLWV3FHyx8GdH9UbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTXp-0000000CF2p-1Ale;
	Thu, 26 Nov 2026 07:05:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTXn-0000000CF2O-0WgD
	for ath10k@lists.infradead.org;
	Thu, 26 Nov 2026 07:05:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ69i732749656
	for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 07:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bdx7UpabDWwudSHqUP7nL1DuePy6rsFlxcZipCI63Tw=; b=SfxZnJwXGrwhNTWt
	6E1PcOPbFWlJN5+VhVOtIC+U8qq3OtacG67E5sVGrFA0PCObYHOkoklBl0gIm5uk
	kp7vWHCGRb5pXcQktvNG3g7oCugN4STy0GPSeRmz6z+Z9zR1pq47zrIXnVGuFWsa
	/tumpI+/NfDlbmNQAT5JBYLTFpy0R3/xd4WEXkC7Eh9BJBR3386FvNi35DbAfjK6
	E19PnmCndJEykOakP7c9rqtny7SkJa7vlYQIpsRzodrsFpQn3nNYm0wkIszzDmiN
	f1T4JGUPkvEqdWD19Y299iIsaYCKaOtFuQdjZAzAzvaCXg/WWEzRAdvttVAemez9
	qZVulg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rg6dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 07:05:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cdb869327e7so5180517a12.0
        for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 23:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795676721; x=1796281521; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bdx7UpabDWwudSHqUP7nL1DuePy6rsFlxcZipCI63Tw=;
        b=Sup216p3aWk1D/FaM68sxUoYWSbqaZQuaDtmcQtufVrcR7p9qewvTgjfkcfHgbVkUf
         +ncDMEVXBeYs3dSmrLZM5WnHPoyAjCiREv0g1OvsLJLawb3dUvqfm75oQRhXU/S6Y7u+
         NCm02/nBhY6qCc5GOmwZTwdPQDcGer1pk/2tXKpGMmmtGBnsDaaf0yaCgTLEMMCQDKfu
         opL6eGdZH/hj2aRAax7O1LlVDfv4l1qbuKI7dUoccpyq9xpzXzA3NY6HQh9aV/mz1xj8
         iDcydCkKboUoVGrVwJhWYSMfz4OxjeiGyiweYJOcFW2ovGNL1wBXcvQtjvOiIITxSG/m
         ucaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676721; x=1796281521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bdx7UpabDWwudSHqUP7nL1DuePy6rsFlxcZipCI63Tw=;
        b=Dxgpi4iSyiQLs+XCA1V38BTk/1PfkvakBDSRzGpE6RJ2YhQsklt+SLstIjr8lIlRxL
         qf2q5krgKZh6JqWwPXpAXx7t5h7FEM8HLE0+v4DJAf70lvZc4EOCAOG1sol+CXhmXQ75
         a3vdYwZ8FQguCzhyuynqmNoG/v/uHMZqep8uu2xzkXc0MhEs0M0RqLHb8pXxuKAJmDrH
         3rjvOrgKFAhKf39dLE4xNXJsNnnHe1erDoeweS2WBNJojf3yYk/qg7BpZuOTsP9dZBYL
         TCSaAoomWhBOGcJ/l2W0L57mgh0kE89Y9QqT2GK0S+yd6lcDccd0/n7BLktN9Sk7USAY
         wudA==
X-Forwarded-Encrypted: i=1; AL+hErHvsSIokNcXxHHG2c3jnzlQIgNwifiBsqSeRUdgvhdc2dbFmkdHe856uHvlKJWpto1a7tag4qk=@lists.infradead.org
X-Gm-Message-State: APuU4Z/0gHSWnu8SdyH/L5QAMgahx8J55Gs8dFZlZCpjgE+gUg6qPFhj
	Dx3pchw00rCsDyKoWeSrpkSK9oX+ZEYngRZL/eH9WGfkqDE63yUv0hmy/+fjaGA+XnYx8gIhnwH
	ZmB+XbX2pVyPC+qliQEJ3NruQoAz1ef+23Wv0ghip5bNoAyhWeLSyCCLcgVk4AIpd
X-Gm-Gg: AZFdTZf4aYlhu4MSVoXhsvDJmHH9WUEKMMkGvb6d+GqxnXRRM0uxuIHezsB8WRyzWPp
	hqrbIUFHKawXOZHXffe+BPexjBvJ1MY6nqZTEvxLcuFwejvqI9j8mG2B6PpzKIeCsiu+jgO36pU
	UDy6Eif5A51XL69CnlciQSThHkNAqM4c0Ksjlg8t01OrOXJxnaHI4j5zfY9PLuzt1c8BaV/fcVt
	DUoMbFMal2laKZ5UVyiz7153Wrsp69Oss67zN3ONNOGWtbu0/fWGStHAd2c3L/N51NUkCfquRM6
	LoaFPsxXNGd7UfoeC29I7u5RBhliHRXrCVGTv2/oDT2L1P7LBurgxTgfraiYLpG4asn9jh4HPHx
	LNddoKku21nw/f6lzdjEwgraMOzFnx2rwMyrLcLLOK/PWmU93xTEHbV/J54jI3m9aIQ8Cinxi6q
	LKK7rkNebaZRafMV5xT5zK4Sq9D/E+5NIojjiSb7kJAw==
X-Received: by 2002:a17:903:2282:b0:2f0:82df:b8a6 with SMTP id d9443c01a7336-2f082dfbfa2mr135854105ad.59.1795676720734;
        Wed, 25 Nov 2026 23:05:20 -0800 (PST)
X-Received: by 2002:a17:903:2282:b0:2f0:82df:b8a6 with SMTP id d9443c01a7336-2f082dfbfa2mr135853805ad.59.1795676720167;
        Wed, 25 Nov 2026 23:05:20 -0800 (PST)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0bc695f31sm41415355ad.49.2026.11.25.23.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:05:19 -0800 (PST)
Message-ID: <7e396e37-d70b-4091-8764-f416b1ddc7aa@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:05:16 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 03/10] wifi: ath10k: wake blocked waiters when
 entering WEDGED state
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-3-53d6a04490e0@oss.qualcomm.com>
 <CAFEp6-2pecH+PxiDv+VpCfUyQabGSDWitHPbxpAv57fWTiP=mA@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-2pecH+PxiDv+VpCfUyQabGSDWitHPbxpAv57fWTiP=mA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNiBTYWx0ZWRfX5qKJWPBrAFmp
 qFtdR+BvveOzBqR5xcU1OcmY1lqHWt0ErxCcEjntx3AtZg+HmB7VcgzPiEWaOhAAmSfUC2lYc80
 xklA/uPpF9UZ07X3AzozzjEwK98BybCQwq1GfV2qTTTQclFfdU25qb2dv5pPxgLd7YyK4kXYBdo
 4k27wCYHco0Id0QriWKnKNINB82cDyhT2D/uxgW4qSS+6kMWQR284/RqTz7bdUsKss/kRRtnx2+
 p7+9PJN/TwsrKBfJsuZ60ZzO8Woc2n/RwWcHRHgjenTIsF20xqkjWW4o4yaW5ftdZWUdqTfP8xC
 5ylXh6IErrCUgpUl6ylVxh5XyiikFRALDA97abWgnwy4OIarhbOcXZP2S2dwMkZsI8mcGTYHtVY
 9ZoSfFCF3sDT3KCoHqnJyoYnx9vUZIrtrA6QgHJdFS1BRCMFt+Qk4IMvPGPqgQB5dNMPmy1yDHi
 HlqS1VKRCc8aI8lUdWw==
X-Proofpoint-GUID: NVX9BiGZIqDjA1oyLBibwz3PoCHcYb2J
X-Proofpoint-ORIG-GUID: NVX9BiGZIqDjA1oyLBibwz3PoCHcYb2J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNiBTYWx0ZWRfX6Jcyb9n/EUfy
 jcCXkMqTFaxvhp+R7hQ+CwQsU7EVbx3avqgZWEqtT9F5fsTnJEFMVvIDhJJPTUmwEcRomhMEwgX
 y39X772BSXPS42P56vBfJmErjD/3zw8=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b07da31 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4gwAILDwourXv-2xtFAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_230523_173232_A33A1164 
X-CRM114-Status: GOOD (  19.99  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/25/2026 6:29 PM, Loic Poulain wrote:
> On Fri, Nov 20, 2026 at 9:42 AM Kang Yang <kang.yang@oss.qualcomm.com> wrote:
>>
>> Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
>> hardware is unreliable") added a fail-count based transition
>> to ATH10K_STATE_WEDGED after repeated recovery failures.
>>
>> When recovery starts, ath10k_core_restart() sets
>> ATH10K_FLAG_CRASH_FLUSH and wakes waiters already blocked at
>> the time the failure is detected. However, additional waits
>> may be created later while the recovery attempt is still in
>> progress.
>>
>> If recovery ultimately fails and the device transitions to
>> ATH10K_STATE_WEDGED, those later waiters continue sleeping
>> until their individual timeouts expire even though no further
>> progress is possible.
>>
>> On suspend/resume, these extra wait timeouts consume watchdog
>> budget. Crash logs show cases where one or two such timeouts
>> are enough to cause the suspend watchdog to fire before the
>> driver finishes shutting down.
>>
>> Apply the same CRASH_FLUSH, queue-stop and waiter wakeup
>> handling when entering ATH10K_STATE_WEDGED so blocked callers
>> fail immediately once the driver gives up.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>>
>> Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c | 43 +++++++++++++++++++++++-----------
>>   1 file changed, 29 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index b536c21630b1..3bb4d2742c30 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -2533,6 +2533,32 @@ static int ath10k_init_hw_params(struct ath10k *ar)
>>          return 0;
>>   }
>>
>> +static void ath10k_core_wake_all_waiters(struct ath10k *ar)
>> +{
>> +       complete(&ar->scan.started);
>> +       complete(&ar->scan.completed);
>> +       complete(&ar->scan.on_channel);
>> +       complete(&ar->offchan_tx_completed);
>> +       complete(&ar->install_key_done);
>> +       complete(&ar->vdev_setup_done);
>> +       complete(&ar->vdev_delete_done);
>> +       complete(&ar->thermal.wmi_sync);
>> +       complete(&ar->bss_survey_done);
>> +       wake_up(&ar->htt.empty_tx_wq);
>> +       wake_up(&ar->wmi.tx_credits_wq);
>> +       wake_up(&ar->peer_mapping_wq);
>> +}
>> +
>> +static void ath10k_core_enter_wedged(struct ath10k *ar)
>> +{
>> +       ar->state = ATH10K_STATE_WEDGED;
>> +
>> +       set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
>> +
>> +       ieee80211_stop_queues(ar->hw);
>> +       ath10k_core_wake_all_waiters(ar);
>> +}
>> +
>>   static void ath10k_core_recovery_check_work(struct work_struct *work)
>>   {
>>          struct ath10k *ar = container_of(work, struct ath10k,
>> @@ -2551,7 +2577,7 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
>>
>>          ath10k_err(ar, "recovery did not complete in %u ms, will shutdown driver!\n",
>>                     jiffies_to_msecs(ATH10K_RECOVERY_TIMEOUT_HZ));
>> -       ar->state = ATH10K_STATE_WEDGED;
>> +       ath10k_core_enter_wedged(ar);
>>   }
>>
>>   void ath10k_core_start_recovery(struct ath10k *ar)
>> @@ -2618,18 +2644,7 @@ static void ath10k_core_restart(struct work_struct *work)
>>
>>          ieee80211_stop_queues(ar->hw);
>>          ath10k_drain_tx(ar);
>> -       complete(&ar->scan.started);
>> -       complete(&ar->scan.completed);
>> -       complete(&ar->scan.on_channel);
>> -       complete(&ar->offchan_tx_completed);
>> -       complete(&ar->install_key_done);
>> -       complete(&ar->vdev_setup_done);
>> -       complete(&ar->vdev_delete_done);
>> -       complete(&ar->thermal.wmi_sync);
>> -       complete(&ar->bss_survey_done);
>> -       wake_up(&ar->htt.empty_tx_wq);
>> -       wake_up(&ar->wmi.tx_credits_wq);
>> -       wake_up(&ar->peer_mapping_wq);
>> +       ath10k_core_wake_all_waiters(ar);
>>
>>          /* TODO: We can have one instance of cancelling coverage_class_work by
>>           * moving it to ath10k_halt(), so that both stop() and restart() would
>> @@ -2664,7 +2679,7 @@ static void ath10k_core_restart(struct work_struct *work)
>>                  /* hw restart might be requested from multiple places */
>>                  break;
>>          case ATH10K_STATE_RESTARTED:
>> -               ar->state = ATH10K_STATE_WEDGED;
>> +               ath10k_core_enter_wedged(ar);
> 
> ath10k_core_enter_wedged call ieee80211_stop_queues(), which is also
> called earlier in this function, is it expected and harmless?


mac80211 will make this harmless:
static void __ieee80211_stop_queue(struct ieee80211_hw *hw, int queue,
				   enum queue_stop_reason reason,
				   bool refcounted)
{
	struct ieee80211_local *local = hw_to_local(hw);

	if (WARN_ON(queue >= hw->queues))
		return;

	if (!refcounted)   // refcounted=false
		local->q_stop_reasons[queue][reason] = 1;
	else
		local->q_stop_reasons[queue][reason]++;

	trace_stop_queue(local, queue, reason,
			 local->q_stop_reasons[queue][reason]);

	set_bit(reason, &local->queue_stop_reasons[queue]);
}




> 
>>                  fallthrough;
>>          case ATH10K_STATE_WEDGED:
>>                  ath10k_warn(ar, "device is wedged, will not restart\n");
>>
>> --
>> 2.34.1
>>


