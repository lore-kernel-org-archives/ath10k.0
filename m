Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccAav-0007h3-CN
 for ath10k@lists.infradead.org; Fri, 10 Feb 2017 12:46:35 +0000
MIME-Version: 1.0
Subject: Re: [RFC,04/10] ath10k: new fw fetch functionality
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1484343309-6327-5-git-send-email-erik.stromdahl@gmail.com>
References: <1484343309-6327-5-git-send-email-erik.stromdahl@gmail.com>
Message-ID: <6c9dfcb8e55c49818f43492ac8641947@eusanexr01a.eu.qualcomm.com>
Date: Fri, 10 Feb 2017 04:45:43 -0800
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> wrote:
> A new function for creating the fw file name dynamically.
> 
> Since both SDIO and USB based chipsets will use different
> firmware from the PCIe and AHB chipsets, the fw file name
> is created dynamically.
> 
> The new firmware names are:
> 
> For PCIe and AHB:
> firmware-<api_version>.bin (same as before)
> 
> For SDIO:
> firmware-sdio-<api_version>.bin
> 
> For USB:
> firmware-usb-<api_version>.bin
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>

Actually I needed this for something else so I took this into one of my
patchsets with small modifications:

ath10k: fetch firmware images in a loop
https://patchwork.kernel.org/patch/9566667/

-- 
https://patchwork.kernel.org/patch/9516551/

Documentation about submitting wireless patches and checking status
from patchwork:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
