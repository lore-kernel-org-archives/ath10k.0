Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqgQv-0000Ea-UU
 for ath10k@lists.infradead.org; Mon, 04 Feb 2019 15:45:19 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: implement set_base_macaddr to fix rx-bssid mask
 in multiple APs conf
References: <20190114153558.972-1-chunkeey@gmail.com>
Date: Mon, 04 Feb 2019 17:45:12 +0200
In-Reply-To: <20190114153558.972-1-chunkeey@gmail.com> (Christian Lamparter's
 message of "Mon, 14 Jan 2019 16:35:58 +0100")
Message-ID: <87tvhjd0c7.fsf@kamboji.qca.qualcomm.com>
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
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Mathias Kresin <dev@kresin.me>, Ben Greear <greearb@candelatech.com>, Felix Fietkau <nbd@nbd.name>

Christian Lamparter <chunkeey@gmail.com> writes:

> Many integrated QCA9984 WiFis in various IPQ806x platform routers
> from various vendors (Netgear R7800, ZyXEL NBG6817, TP-LINK C2600,
> etc.) have either blank, bogus or non-unique MAC-addresses in
> their calibration data.
>
> As a result, OpenWrt utilizes a discouraged binary calibration data
> patching method that allows to modify the device's MAC-addresses right
> at the source. This is because the ath10k' firmware extracts the MAC
> address from the supplied radio/calibration data and issues a response
> to the ath10k linux driver. Which was designed to take the main MAC in
> ath10k_wmi_event_ready().
>
> Part of the "setting an alternate MAC" issue was already tackled by a
> patch from Brian Norris:
> commit 9d5804662ce1
> ("ath10k: retrieve MAC address from system firmware if provided")
> by allowing the option to specify an alternate MAC-address with the
> established device_get_mac_address() function which extracts the right
> address from DeviceTree/fwnode mac-address or local-mac-address
> properties and saves it for later.
>
> However, Ben Greear noted that the Qualcomm's ath10k firmware is liable
> to not properly calculate its rx-bssid mask in this case. This can cause
> issues in the popluar "multiple AP with a single ath10k instance"
> configurations.
>
> To improve MAC address handling, Felix Fietkau suggested to call
> pdev_set_base_macaddr_cmdid before bringing up the first vif and
> use the first vif MAC address there. Which is in ath10k_core_start().
>
> This patch implement Felix Fietkau's request to
> "call pdev_set_base_macaddr_cmdid before bringing up the first vif".
> The pdev_set_base_macaddr_cmdid is already declared for all devices
> and version. The driver just needed the support code for this
> function.
>
> BugLink: https://lists.openwrt.org/pipermail/openwrt-devel/2018-November/014595.html
> Fixes: 9d5804662ce1 ("ath10k: retrieve MAC address from system firmware if provided")
> Cc: Brian Norris <briannorris@chromium.org>
> Cc: Ben Greear <greearb@candelatech.com>
> Cc: Felix Fietkau <nbd@nbd.name>
> Cc: Mathias Kresin <dev@kresin.me>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -2649,6 +2649,13 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
>  		goto err_hif_stop;
>  	}
>  
> +	status = ath10k_wmi_pdev_set_base_macaddr(ar, ar->mac_addr);
> +	if (status) {
> +		ath10k_err(ar,
> +			   "failed to set base mac address: %d\n", status);
> +		goto err_hif_stop;
> +	}

Oh, and as the new parameter is not supported with WMI TLV interface
(QCA6174, WCN3990 etc) this will print an error on those. I think you
need to check for -EOPNOTSUPP and then just ignore the error on that
case. IIRC we have similar checks elsewhere in ath10k.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
