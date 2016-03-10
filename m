Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ae3Ty-0007ie-GN
 for ath10k@lists.infradead.org; Thu, 10 Mar 2016 16:30:39 +0000
Date: Thu, 10 Mar 2016 08:30:10 -0800
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] ath10k: fix debugfs pktlog_filter write
Message-ID: <20160310163010.GA29861@kroah.com>
References: <1457601538-30751-1-git-send-email-akolli@qti.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1457601538-30751-1-git-send-email-akolli@qti.qualcomm.com>
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
To: akolli@qti.qualcomm.com
Cc: akolli@codeaurora.org, linux-wireless@vger.kernel.org, stable@vger.kernel.org, ath10k@lists.infradead.org

On Thu, Mar 10, 2016 at 02:48:58PM +0530, akolli@qti.qualcomm.com wrote:
> From: Anilkumar Kolli <akolli@qti.qualcomm.com>
> 
> It is observed that, we are disabling the packet log if we write same
> value to the pktlog_filter for the second time. Always enable pktlogs
> on non zero filter.
> 
> Fixes: 90174455ae05 ("ath10k: add support to configure pktlog filter")
> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/debug.c |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
