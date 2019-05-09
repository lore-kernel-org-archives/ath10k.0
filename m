Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOiuK-0002ok-1E
 for ath10k@lists.infradead.org; Thu, 09 May 2019 13:16:21 +0000
Date: Thu, 9 May 2019 15:16:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] ath10k: Change the warning message string
Message-ID: <20190509131616.GB19094@kroah.com>
References: <20190509121500.4730-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190509121500.4730-1-festevam@gmail.com>
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
To: Fabio Estevam <festevam@gmail.com>
Cc: andreyknvl@google.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, kvalo@codeaurora.org

On Thu, May 09, 2019 at 09:15:00AM -0300, Fabio Estevam wrote:
> The "WARNING" string confuses syzbot, which thinks it found
> a crash [1].
> 
> Change the string to avoid such problem.
> 
> [1] https://lkml.org/lkml/2019/5/9/243
> 
> Reported-by: syzbot+c1b25598aa60dcd47e78@syzkaller.appspotmail.com
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/net/wireless/ath/ath10k/usb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
