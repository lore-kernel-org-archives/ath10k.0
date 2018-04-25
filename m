Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fBMIj-0001Ik-C1
 for ath10k@lists.infradead.org; Wed, 25 Apr 2018 15:25:46 +0000
Date: Wed, 25 Apr 2018 17:25:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/9] firmware: some documentation fixes
Message-ID: <20180425152526.GA4921@kroah.com>
References: <20180423201205.20533-1-andresx7@gmail.com>
 <20180423201205.20533-2-andresx7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180423201205.20533-2-andresx7@gmail.com>
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

On Mon, Apr 23, 2018 at 04:11:57PM -0400, Andres Rodriguez wrote:
> Including:
>  - Fixup outdated kernel-doc paths
>  - Slightly too short title underline
>  - Some typos
> 
> Signed-off-by: Andres Rodriguez <andresx7@gmail.com>
> ---
>  Documentation/driver-api/firmware/request_firmware.rst | 16 ++++++++--------
>  drivers/base/firmware_loader/fallback.c                |  4 ++--
>  drivers/base/firmware_loader/fallback.h                |  2 +-
>  3 files changed, 11 insertions(+), 11 deletions(-)

This fails to apply to my driver-core-next branch.  Can you please
rebase it and resend?

thanks,

greg k-h

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
