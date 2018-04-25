Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBNP1-0000tm-By
 for ath10k@lists.infradead.org; Wed, 25 Apr 2018 16:36:20 +0000
Date: Wed, 25 Apr 2018 18:35:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] usb: typec: fix formatting errors that cause build
 breakage
Message-ID: <20180425163559.GA30492@kroah.com>
References: <20180425152617.GA5058@kroah.com>
 <20180425162540.11574-1-andresx7@gmail.com>
 <20180425162540.11574-2-andresx7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180425162540.11574-2-andresx7@gmail.com>
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
To: Andres Rodriguez <andresx7@gmail.com>
Cc: arend.vanspriel@broadcom.com, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, hdegoede@redhat.com, mcgrof@kernel.org, alexdeucher@gmail.com, christian.koenig@amd.com, kvalo@codeaurora.org

On Wed, Apr 25, 2018 at 12:25:40PM -0400, Andres Rodriguez wrote:
> The ASCII art illustration should be marked as a preformatted text
> block. Otherwise the build will fail when attempting to parse it.
> 
> Fixes: bdecb33af34f ( "usb: typec: API for controlling USB ..." )
> Signed-off-by: Andres Rodriguez <andresx7@gmail.com>
> ---
>  Documentation/driver-api/usb/typec.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This is already in my usb tree and will go to Linus in a day or so.

thanks,

greg k-h

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
