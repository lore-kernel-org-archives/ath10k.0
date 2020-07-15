Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jveYV-0006nX-JN
 for ath10k@lists.infradead.org; Wed, 15 Jul 2020 10:22:30 +0000
MIME-Version: 1.0
Subject: Re: [PATCH 05/17] drivers: net: Fix trivial spelling
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200609124610.3445662-6-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-6-kieran.bingham+renesas@ideasonboard.com>
Message-Id: <20200715102209.BDB2AC43391@smtp.codeaurora.org>
Date: Wed, 15 Jul 2020 10:22:09 +0000 (UTC)
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
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Wenwen Wang <wenwen@cs.uga.edu>, Jiri Kosina <trivial@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Martin Habets <mhabets@solarflare.com>, open list <linux-kernel@vger.kernel.org>, Kieran Bingham <kieran.bingham@ideasonboard.com>, "open list:QUALCOMM ATHEROS ATH10K WIRELESS
 DRIVER" <ath10k@lists.infradead.org>, Ard Biesheuvel <ardb@kernel.org>, linux-renesas-soc@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Alexey Dobriyan <adobriyan@gmail.com>, Colin Ian King <colin.king@canonical.com>, "open list:NETWORKING DRIVERS
 WIRELESS" <linux-wireless@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, Shannon Nelson <snelson@pensando.io>, "David S. Miller" <davem@davemloft.net>, Dan Carpenter <dan.carpenter@oracle.com>

Kieran Bingham <kieran.bingham+renesas@ideasonboard.com> wrote:

> The word 'descriptor' is misspelled throughout the tree.
> 
> Fix it up accordingly:
>     decriptors -> descriptors
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

I recommend splitting wan and wireless changes to separate patches as I
cannot take changes to wan subsystem.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11595487/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
