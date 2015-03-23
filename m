Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ya4gF-00079f-Hi
 for ath10k@lists.infradead.org; Mon, 23 Mar 2015 15:54:22 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v4 5/6] ath10k: add wmi support for tdls
References: <1426849379-7562-1-git-send-email-marek.puzyniak@tieto.com>
 <1426849379-7562-6-git-send-email-marek.puzyniak@tieto.com>
Date: Mon, 23 Mar 2015 17:53:50 +0200
In-Reply-To: <1426849379-7562-6-git-send-email-marek.puzyniak@tieto.com>
 (Marek Puzyniak's message of "Fri, 20 Mar 2015 12:02:58 +0100")
Message-ID: <87pp7zd81d.fsf@kamboji.qca.qualcomm.com>
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Marek Puzyniak <marek.puzyniak@tieto.com> writes:

> As a part of tdls implementation introduce
> tdls related wmi data structures, constant
> values and functions.
>
> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>

This patch had non-trivial conflicts, please check carefully my
resolution in the pending branch.

  CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi.h
  CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi-tlv.h
  CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi-tlv.c
  CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi-ops.h

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
