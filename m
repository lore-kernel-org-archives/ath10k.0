Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsuMp-0006Na-1C
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 14:11:51 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: don't rebuild all the time
References: <1416423188-8394-1-git-send-email-johannes@sipsolutions.net>
Date: Mon, 24 Nov 2014 16:11:23 +0200
In-Reply-To: <1416423188-8394-1-git-send-email-johannes@sipsolutions.net>
 (Johannes Berg's message of "Wed, 19 Nov 2014 19:53:08 +0100")
Message-ID: <87wq6k6644.fsf@kamboji.qca.qualcomm.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Johannes Berg <johannes@sipsolutions.net> writes:

> There are better ways to get the kernel information, use the
> utsname and omit the version code entirely since it's duplicate.
> The version magic is rather useless anyway
>
> Signed-off-by: Johannes Berg <johannes@sipsolutions.net>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
