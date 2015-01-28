Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGNsH-00057v-6i
 for ath10k@lists.infradead.org; Wed, 28 Jan 2015 08:21:21 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: implement sta keepalive command
References: <1421749440-10457-1-git-send-email-michal.kazior@tieto.com>
Date: Wed, 28 Jan 2015 10:20:43 +0200
In-Reply-To: <1421749440-10457-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 20 Jan 2015 11:23:59 +0100")
Message-ID: <87h9vb9uzo.fsf@kamboji.qca.qualcomm.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>
> New wmi-tlv firmware for qca6174 has STA keepalive
> service available. The service can provide
> automatic idle connection polling via NullFunc
> frames to AP when acting as a client.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

I had a trivial conflict, please check my resolution from the pending
branch:

Applying: ath10k: implement sta keepalive command
Using index info to reconstruct a base tree...
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath10k/wmi.h
Auto-merging drivers/net/wireless/ath/ath10k/wmi-tlv.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi-tlv.h
Auto-merging drivers/net/wireless/ath/ath10k/wmi-tlv.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi-tlv.c
Auto-merging drivers/net/wireless/ath/ath10k/wmi-ops.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi-ops.h
Failed to merge in the changes.
Patch failed at 0001 ath10k: implement sta keepalive command

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
