Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsvMy-0002CA-US
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 15:16:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/3] ath10k: Fix locking for WEP keys
References: <1416796657-24657-1-git-send-email-sujith@msujith.org>
 <1416796657-24657-3-git-send-email-sujith@msujith.org>
Date: Mon, 24 Nov 2014 17:15:38 +0200
In-Reply-To: <1416796657-24657-3-git-send-email-sujith@msujith.org> (Sujith
 Manoharan's message of "Mon, 24 Nov 2014 08:07:36 +0530")
Message-ID: <87h9xo6351.fsf@kamboji.qca.qualcomm.com>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sujith Manoharan <sujith@msujith.org> writes:

> From: Sujith Manoharan <c_manoha@qca.qualcomm.com>
>
> peer->keys needs to be protected by data_lock
> since it is also accessed from the WMI path.
>
> Both install() and clear() routines for peer
> keys modify the key contents, so use the data_lock
> to avoid races.
>
> Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>

Can you also document the field with "protected by data_lock" in core.h?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
