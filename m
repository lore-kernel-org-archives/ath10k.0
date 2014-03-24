Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WS1NG-0000of-BW
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 09:40:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 7/8] ath10k: improve way we play with attention flags
References: <1395394341-3958-1-git-send-email-janusz.dziedzic@tieto.com>
 <1395394341-3958-8-git-send-email-janusz.dziedzic@tieto.com>
Date: Mon, 24 Mar 2014 11:40:10 +0200
In-Reply-To: <1395394341-3958-8-git-send-email-janusz.dziedzic@tieto.com>
 (Janusz Dziedzic's message of "Fri, 21 Mar 2014 10:32:20 +0100")
Message-ID: <87mwgg6ikl.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> Remove almost the same code, and do only once
> __le32_to_cpu() conversion.
>
> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>

This patch introduces one checkpatch warning:

drivers/net/wireless/ath/ath10k/htt_rx.c:1209: CHECK: No space is necessary after a cast

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
