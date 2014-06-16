Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH -next 13/26] ath: Use dma_zalloc_coherent
References: <cover.1402863904.git.joe@perches.com>
 <55b103a2ec78c0031b348e103603bf9a0d9cac3b.1402863905.git.joe@perches.com>
Date: Mon, 16 Jun 2014 12:24:46 +0300
In-Reply-To: <55b103a2ec78c0031b348e103603bf9a0d9cac3b.1402863905.git.joe@perches.com>
 (Joe Perches's message of "Sun, 15 Jun 2014 13:37:42 -0700")
Message-ID: <87fvj52om9.fsf@kamboji.qca.qualcomm.com>
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
To: Joe Perches <joe@perches.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "John W. Linville" <linville@tuxdriver.com>, wcn36xx@lists.infradead.org, Eugene Krasnikov <k.eugene.e@gmail.com>

Joe Perches <joe@perches.com> writes:

> Use the zeroing function instead of dma_alloc_coherent & memset(,0,)
>
> Signed-off-by: Joe Perches <joe@perches.com>

For ath10k:

Acked-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
