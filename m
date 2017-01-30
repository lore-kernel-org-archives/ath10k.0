Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cY7vz-0002wQ-Dw
 for ath10k@lists.infradead.org; Mon, 30 Jan 2017 09:07:36 +0000
Date: Mon, 30 Jan 2017 10:06:55 +0100
From: Greg KH <greg@kroah.com>
Subject: Re: [PATCHv2] ath10k: fix boot failure in UTF mode/testmode
Message-ID: <20170130090655.GB29062@kroah.com>
References: <1485765958-26802-1-git-send-email-c_traja@qti.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1485765958-26802-1-git-send-email-c_traja@qti.qualcomm.com>
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
To: c_traja@qti.qualcomm.com
Cc: tamizhchelvam@codeaurora.org, linux-wireless@vger.kernel.org, stable@vger.kernel.org, ath10k@lists.infradead.org

On Mon, Jan 30, 2017 at 02:15:58PM +0530, c_traja@qti.qualcomm.com wrote:
> From: Tamizh chelvam <c_traja@qti.qualcomm.com>
> 
> Rx filter reset and the dynamic tx switch mode (EXT_RESOURCE_CFG)
> configuration are causing the following errors when UTF firmware
> is loaded to the target.
> 
> Error message 1:
> [ 598.015629] ath10k_pci 0001:01:00.0: failed to ping firmware: -110
> [ 598.020828] ath10k_pci 0001:01:00.0: failed to reset rx filter: -110
> [ 598.141556] ath10k_pci 0001:01:00.0: failed to start core (testmode): -110
> 
> Error message 2:
> [ 668.615839] ath10k_ahb a000000.wifi: failed to send ext resource cfg command : -95
> [ 668.618902] ath10k_ahb a000000.wifi: failed to start core (testmode): -95
> 
> Avoiding these configurations while bringing the target in
> testmode is solving the problem.
> 
> Signed-off-by: Tamizh chelvam <c_traja@qti.qualcomm.com>
> ---
> v2:
>    *Added stable@vger.kernel.org in cc list


<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read Documentation/stable_kernel_rules.txt
for how to do this properly.

</formletter>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
