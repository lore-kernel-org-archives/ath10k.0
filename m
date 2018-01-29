Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1egEMs-0006gm-Gc
 for ath10k@lists.infradead.org; Mon, 29 Jan 2018 18:41:24 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v3 1/2] pci: Add vendor id of Ubiquiti Networks
References: <20180125111340.17553-1-tobleminer@gmail.com>
 <20180125111340.17553-2-tobleminer@gmail.com>
 <20180129180349.GB232763@bhelgaas-glaptop.roam.corp.google.com>
Date: Mon, 29 Jan 2018 20:41:07 +0200
In-Reply-To: <20180129180349.GB232763@bhelgaas-glaptop.roam.corp.google.com>
 (Bjorn Helgaas's message of "Mon, 29 Jan 2018 12:03:49 -0600")
Message-ID: <87wp00qzi4.fsf@kamboji.qca.qualcomm.com>
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
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, linux-wireless@vger.kernel.org, Tobias Schramm <tobleminer@gmail.com>, ath10k@lists.infradead.org, linux-pci@vger.kernel.org

Bjorn Helgaas <helgaas@kernel.org> writes:

> On Thu, Jan 25, 2018 at 12:13:39PM +0100, Tobias Schramm wrote:
>> Signed-off-by: Tobias Schramm <tobleminer@gmail.com>
>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>
> I see Kalle has already applied this, but if it's updated for any reason,
> please add my ack and change the subject to:
>
>   PCI: Add Ubiquiti Networks vendor ID
>
> i.e., match the style of previous changes.

I only applied it to my pending branch which I use for build testing
etc. and I can easily change it, which I now did:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=3c4cdd0851bc114f8b6d9f9db0b0479737bbd2d8

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
