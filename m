Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsSd4-0003Nb-65
 for ath10k@lists.infradead.org; Sat, 31 Oct 2015 09:39:18 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: set peer MFP flag in peer assoc command
References: <1444194961-12777-1-git-send-email-c_traja@qti.qualcomm.com>
Date: Sat, 31 Oct 2015 11:38:17 +0200
In-Reply-To: <1444194961-12777-1-git-send-email-c_traja@qti.qualcomm.com> (c.
 traja's message of "Wed, 7 Oct 2015 10:46:01 +0530")
Message-ID: <87pozvidiu.fsf@kamboji.qca.qualcomm.com>
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
To: c_traja@qti.qualcomm.com
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, Manikanta pubbisetty <c_mpubbi@qti.qualcomm.com>, ath10k@lists.infradead.org

<c_traja@qti.qualcomm.com> writes:

> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
>
> Set peer's management frame protection flag in peer assoc command,
> this setting will enable/disable encrytion of management frames in fw.
>
> Setting of this flag is based on whether MFP is enabled/disabled at STA
> and a firmware feature flag ATH10K_FW_FEATURE_MFP_SUPPORT. This is because
> only firmwares 10.1.561 and above have support for MFP.
>
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
> Signed-off-by: Manikanta pubbisetty <c_mpubbi@qti.qualcomm.com>

There was a trivial conflict, please check my conflict resolution in the
pending branch:

https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=c33d4ded1d2db2166c14afe602fe7ef645a5b16b

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
