Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuIiM-0005gZ-Dv
 for ath10k@lists.infradead.org; Fri, 28 Nov 2014 10:23:51 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 1/2] dt: bindings: add ath10k wireless device
Date: Fri, 28 Nov 2014 11:23:08 +0100
Message-ID: <5247714.HacITJUipJ@wuerfel>
In-Reply-To: <87fvd3sl9c.fsf@kamboji.qca.qualcomm.com>
References: <20141127120727.17546.61202.stgit@potku.adurom.net>
 <3202372.2AaH3c4qv1@wuerfel> <87fvd3sl9c.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, toshik@chromium.org, ath10k@lists.infradead.org

On Friday 28 November 2014 11:54:39 Kalle Valo wrote:
> 
> Right now ath10k does not support that, but in the future we might want
> to add mac address as well. We need to do some testing with the firmware
> to make sure that we can safely change the "main" address from ath10k.

This is from Documentation/devicetree/bindings/net/ethernet.txt:

- local-mac-address: array of 6 bytes, specifies the MAC address that was
  assigned to the network device;
- mac-address: array of 6 bytes, specifies the MAC address that was last used by
  the boot program; should be used in cases where the MAC address assigned to
  the device by the boot program is different from the "local-mac-address"
  property;

If the address is fixed, you might still be able to use the local-mac-address
property to communicate the main address. Normally you only have to pass
the mac address in DT if the device itself doesn't know the address. Do you
know where the main address is stored? If it's always known to the card,
we don't need to pass it, and if the card doesn't know it, I suspect it would
be safe to change it.

> And because of Virtual AP (mBSSID) feature we actually would need to
> provide multiple addresses, not just one. Maybe with addr_mask like
> struct wiphy has?
> 
>  * @perm_addr: permanent MAC address of this device
>  * @addr_mask: If the device supports multiple MAC addresses by masking,
>  *      set this to a mask with variable bits set to 1, e.g. if the last
>  *      four bits are variable then set it to 00-00-00-00-00-0f. The actual
>  *      variable bits shall be determined by the interfaces added, with
>  *      interfaces not matching the mask being rejected to be brought up.
> 
>         /* permanent MAC address(es) */
>         u8 perm_addr[ETH_ALEN];
>         u8 addr_mask[ETH_ALEN];

We don't have a common binding for this yet, I think drivers that do this
at the moment just know how many addresses they are allowed to take.

If the mask is generally considered useful, we could probably add that to
the binding though.

	Arnd

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
