Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1egDmn-00082g-PI
 for ath10k@lists.infradead.org; Mon, 29 Jan 2018 18:04:07 +0000
Date: Mon, 29 Jan 2018 12:03:49 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v3 1/2] pci: Add vendor id of Ubiquiti Networks
Message-ID: <20180129180349.GB232763@bhelgaas-glaptop.roam.corp.google.com>
References: <20180125111340.17553-1-tobleminer@gmail.com>
 <20180125111340.17553-2-tobleminer@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180125111340.17553-2-tobleminer@gmail.com>
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
To: Tobias Schramm <tobleminer@gmail.com>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Thu, Jan 25, 2018 at 12:13:39PM +0100, Tobias Schramm wrote:
> Signed-off-by: Tobias Schramm <tobleminer@gmail.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

I see Kalle has already applied this, but if it's updated for any reason,
please add my ack and change the subject to:

  PCI: Add Ubiquiti Networks vendor ID

i.e., match the style of previous changes.

> ---
>  include/linux/pci_ids.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index ab20dc5db423..35871adfdc86 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -149,6 +149,8 @@
>  #define PCI_VENDOR_ID_DYNALINK		0x0675
>  #define PCI_DEVICE_ID_DYNALINK_IS64PH	0x1702
>  
> +#define PCI_VENDOR_ID_UBIQUITI		0x0777
> +
>  #define PCI_VENDOR_ID_BERKOM			0x0871
>  #define PCI_DEVICE_ID_BERKOM_A1T		0xffa1
>  #define PCI_DEVICE_ID_BERKOM_T_CONCEPT		0xffa2
> -- 
> 2.16.0
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
