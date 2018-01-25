Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eef5P-0001ZR-Cg
 for ath10k@lists.infradead.org; Thu, 25 Jan 2018 10:48:55 +0000
Received: by mail-wm0-x241.google.com with SMTP id v123so14039826wmd.5
 for <ath10k@lists.infradead.org>; Thu, 25 Jan 2018 02:48:40 -0800 (PST)
Subject: Re: [PATCH v2 1/2] pci: Add vendor id of Ubiquiti Networks
References: <20180125074131.30622-1-tobleminer@gmail.com>
 <20180125074131.30622-2-tobleminer@gmail.com>
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Message-ID: <5A69B605.60503@broadcom.com>
Date: Thu, 25 Jan 2018 11:48:37 +0100
MIME-Version: 1.0
In-Reply-To: <20180125074131.30622-2-tobleminer@gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Tobias Schramm <tobleminer@gmail.com>, kvalo@qca.qualcomm.com, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org

On 1/25/2018 8:41 AM, Tobias Schramm wrote:
> Signed-off-by: Tobias Schramm <tobleminer@gmail.com>
> ---
>   include/linux/pci_ids.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index ab20dc5db423..6b01ac1e9bce 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -149,6 +149,8 @@
>   #define PCI_VENDOR_ID_DYNALINK		0x0675
>   #define PCI_DEVICE_ID_DYNALINK_IS64PH	0x1702
>
> +#define PCI_VENDOR_ID_UBNT		0x0777

Guess this is the stock symbol, but that does not seem a common approach 
here. Why not just PCI_VENDOR_ID_UBIQUITI?

Regards,
Arend

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
