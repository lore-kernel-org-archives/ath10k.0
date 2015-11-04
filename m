Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtqVT-00019s-IS
 for ath10k@lists.infradead.org; Wed, 04 Nov 2015 05:21:12 +0000
From: "Raja, Tamizh Chelvam" <c_traja@qti.qualcomm.com>
Subject: RE: [PATCH 2/2] ath10k: set peer MFP flag in peer assoc command
Date: Wed, 4 Nov 2015 05:20:43 +0000
Message-ID: <39ba89200efb4ef0a2f5ccd5aca878a6@aphydexm01b.ap.qualcomm.com>
References: <1444194961-12777-1-git-send-email-c_traja@qti.qualcomm.com>
 <87pozvidiu.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87pozvidiu.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
MIME-Version: 1.0
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
>>
>> Set peer's management frame protection flag in peer assoc command, 
>> this setting will enable/disable encrytion of management frames in fw.
>>
>> Setting of this flag is based on whether MFP is enabled/disabled at 
>> STA and a firmware feature flag ATH10K_FW_FEATURE_MFP_SUPPORT. This is 
>> because only firmwares 10.1.561 and above have support for MFP.
>>
>> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
>> Signed-off-by: Manikanta pubbisetty <c_mpubbi@qti.qualcomm.com>

>There was a trivial conflict, please check my conflict resolution in the pending branch:

>https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=c33d4ded1d2db2166c14afe602fe7ef645a5b16b


When I try to apply this patch. I got following conflict.

Checking patch drivers/net/wireless/ath/ath10k/core.c...
Checking patch drivers/net/wireless/ath/ath10k/core.h...
Hunk #1 succeeded at 512 (offset -1 lines).
Checking patch drivers/net/wireless/ath/ath10k/htt_tx.c...
Checking patch drivers/net/wireless/ath/ath10k/mac.c...
error: while searching for:
                ath10k_dbg(ar, ATH10K_DBG_WMI, "%s: wpa ie found\n", __func__);
                arg->peer_flags |= ar->wmi.peer_flags->need_gtk_2_way;
        }
}

static void ath10k_peer_assoc_h_rates(struct ath10k *ar,

error: patch failed: drivers/net/wireless/ath/ath10k/mac.c:2009
Hunk #3 succeeded at 2480 (offset -6 lines).
Applied patch drivers/net/wireless/ath/ath10k/core.c cleanly.
Applied patch drivers/net/wireless/ath/ath10k/core.h cleanly.
Applied patch drivers/net/wireless/ath/ath10k/htt_tx.c cleanly.
Applying patch drivers/net/wireless/ath/ath10k/mac.c with 1 rejects...
Hunk #1 applied cleanly.
Rejected hunk #2.
Hunk #3 applied cleanly.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
