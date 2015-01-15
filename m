Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBiKA-0001RB-2K
 for ath10k@lists.infradead.org; Thu, 15 Jan 2015 11:10:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] ath10k: add wmi-tlv debug event handling
References: <1420715897-18706-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 15 Jan 2015 13:10:14 +0200
In-Reply-To: <1420715897-18706-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 8 Jan 2015 12:18:15 +0100")
Message-ID: <87k30oxpt5.fsf@kamboji.qca.qualcomm.com>
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

> New wmi-tlv firmware will deliver debug messages
> via new events.
>
> Note: This may yield some (trivial) conflicts
> against my beacon/presp template patchset.

You were right, but bonus points for having valid parent commit ids for
the 3-way merge! :)

Applying: ath10k: implement diag data container event
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath10k/wmi-tlv.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi-tlv.h
Auto-merging drivers/net/wireless/ath/ath10k/wmi-tlv.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi-tlv.c
Failed to merge in the changes.
Patch failed at 0001 ath10k: implement diag data container event

Please double check my conflict resolution in ath-next-test.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
