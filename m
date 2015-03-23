Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ya4Un-000651-Gn
 for ath10k@lists.infradead.org; Mon, 23 Mar 2015 15:42:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4 0/7] ath10k: add multi-channel support
References: <1426595448-1630-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 23 Mar 2015 17:41:59 +0200
In-Reply-To: <1426595448-1630-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 17 Mar 2015 12:30:41 +0000")
Message-ID: <87twxbd8l4.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> New qca6174 with wmi-tlv firmware supports
> multi-channel operation. To make use of it
> ath10k needs a few changes: implement mac80211's
> chanctx API and rework tx queue control a bit.

3-way merge fails:

Applying: ath10k: allow empty ssid vdev config
Applying: ath10k: implement chanctx API
error: short SHA1 7b3e6ca is ambiguous.
fatal: sha1 information is lacking or useless (drivers/net/wireless/ath/ath10k/wmi.c).
Repository lacks necessary blobs to fall back on 3-way merge.
Cannot fall back to three-way merge.
Patch failed at 0002 ath10k: implement chanctx API

And no wonder, 7 chars is just too short SHA1 abbreviation. Is there any
way to make that longer?

Anyway, can you please rebase?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
