Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqihg-0008QG-FV
 for ath10k@lists.infradead.org; Mon, 04 Feb 2019 18:10:46 +0000
Received: by mail-wm1-x344.google.com with SMTP id b11so899497wmj.1
 for <ath10k@lists.infradead.org>; Mon, 04 Feb 2019 10:10:43 -0800 (PST)
From: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH] ath10k: implement set_base_macaddr to fix rx-bssid mask
 in multiple APs conf
Date: Mon, 04 Feb 2019 19:10:38 +0100
Message-ID: <4891660.4ehrp1WKpm@debian64>
In-Reply-To: <87tvhjd0c7.fsf@kamboji.qca.qualcomm.com>
References: <20190114153558.972-1-chunkeey@gmail.com>
 <87tvhjd0c7.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Mathias Kresin <dev@kresin.me>, Ben Greear <greearb@candelatech.com>, Felix Fietkau <nbd@nbd.name>

On Monday, February 4, 2019 4:45:12 PM CET Kalle Valo wrote:
> Christian Lamparter <chunkeey@gmail.com> writes:
> 
> > Many integrated QCA9984 WiFis in various IPQ806x platform routers
> > from various vendors (Netgear R7800, ZyXEL NBG6817, TP-LINK C2600,
> > etc.) have either blank, bogus or non-unique MAC-addresses in
> > their calibration data.
> >
> > As a result, OpenWrt utilizes a discouraged binary calibration data
> > patching method that allows to modify the device's MAC-addresses right
> > at the source. This is because the ath10k' firmware extracts the MAC
> > address from the supplied radio/calibration data and issues a response
> > to the ath10k linux driver. Which was designed to take the main MAC in
> > ath10k_wmi_event_ready().
> >
> > Part of the "setting an alternate MAC" issue was already tackled by a
> > patch from Brian Norris:
> > commit 9d5804662ce1
> > ("ath10k: retrieve MAC address from system firmware if provided")
> > by allowing the option to specify an alternate MAC-address with the
> > established device_get_mac_address() function which extracts the right
> > address from DeviceTree/fwnode mac-address or local-mac-address
> > properties and saves it for later.
> >
> > However, Ben Greear noted that the Qualcomm's ath10k firmware is liable
> > to not properly calculate its rx-bssid mask in this case. This can cause
> > issues in the popluar "multiple AP with a single ath10k instance"
> > configurations.
> >
> > To improve MAC address handling, Felix Fietkau suggested to call
> > pdev_set_base_macaddr_cmdid before bringing up the first vif and
> > use the first vif MAC address there. Which is in ath10k_core_start().
> >
> > This patch implement Felix Fietkau's request to
> > "call pdev_set_base_macaddr_cmdid before bringing up the first vif".
> > The pdev_set_base_macaddr_cmdid is already declared for all devices
> > and version. The driver just needed the support code for this
> > function.
> >
> > BugLink: https://lists.openwrt.org/pipermail/openwrt-devel/2018-November/014595.html
> > Fixes: 9d5804662ce1 ("ath10k: retrieve MAC address from system firmware if provided")
> > Cc: Brian Norris <briannorris@chromium.org>
> > Cc: Ben Greear <greearb@candelatech.com>
> > Cc: Felix Fietkau <nbd@nbd.name>
> > Cc: Mathias Kresin <dev@kresin.me>
> > Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> 

I concated both reviews into this response.

> > @@ -8885,6 +8904,7 @@ static const struct wmi_ops wmi_ops = {
> >  
> >  	.gen_pdev_suspend = ath10k_wmi_op_gen_pdev_suspend,
> >  	.gen_pdev_resume = ath10k_wmi_op_gen_pdev_resume,
> > +	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
> >  	.gen_pdev_set_rd = ath10k_wmi_op_gen_pdev_set_rd,
> >  	.gen_pdev_set_param = ath10k_wmi_op_gen_pdev_set_param,
> >  	.gen_init = ath10k_wmi_op_gen_init,
> > @@ -8960,6 +8980,7 @@ static const struct wmi_ops wmi_10_1_ops = {
> >  
> >  	.gen_pdev_suspend = ath10k_wmi_op_gen_pdev_suspend,
> >  	.gen_pdev_resume = ath10k_wmi_op_gen_pdev_resume,
> > +	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
> >  	.gen_pdev_set_param = ath10k_wmi_op_gen_pdev_set_param,
> >  	.gen_stop_scan = ath10k_wmi_op_gen_stop_scan,
> >  	.gen_vdev_create = ath10k_wmi_op_gen_vdev_create,
> > @@ -9032,6 +9053,7 @@ static const struct wmi_ops wmi_10_2_ops = {
> >  
> >  	.gen_pdev_suspend = ath10k_wmi_op_gen_pdev_suspend,
> >  	.gen_pdev_resume = ath10k_wmi_op_gen_pdev_resume,
> > +	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
> >  	.gen_pdev_set_param = ath10k_wmi_op_gen_pdev_set_param,
> >  	.gen_stop_scan = ath10k_wmi_op_gen_stop_scan,
> >  	.gen_vdev_create = ath10k_wmi_op_gen_vdev_create,
> 
> These are in practise obsolete WMI interfaces so not sure if it makes it
> worth to support this parameter in them. But on the other hand it won't
> hurt either, so dunno.
Ok. I looked what firmware interfaces (wmi_cmd_map) supported the 
pdev_set_base_macaddr_cmdid and all did (including the old and tlv)
so I added the line everywhere I could.
As far as the support for the old firmwares goes: I don't think
anybody with a current ath10k is willingly still stuck on the 10.1,
10.2 firmware. So, I might as well just remove those for 10_2, 10_1 and MAIN. 
 
> > @@ -9115,6 +9137,7 @@ static const struct wmi_ops wmi_10_2_4_ops = {
> >  	.gen_peer_create = ath10k_wmi_op_gen_peer_create,
> >  	.gen_peer_delete = ath10k_wmi_op_gen_peer_delete,
> >  	.gen_peer_flush = ath10k_wmi_op_gen_peer_flush,
> > +	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
> >  	.gen_peer_set_param = ath10k_wmi_op_gen_peer_set_param,
> >  	.gen_set_psmode = ath10k_wmi_op_gen_set_psmode,
> >  	.gen_set_sta_ps = ath10k_wmi_op_gen_set_sta_ps,
> 
> This is only used by QCA988X. Did you test with that? If not, IMHO
> better not to enable it for 10.2.4 until it's tested.
Yes. I tested it on a CUS-223 with 10.2.4-1.0-00041 and after. I also know
that Mathias Kresin tested it on his Homehub 5a Router (QCA9880) with both
ath10k (most likely with the same 10.2.4-1.0-00041) and Ben's ath10k-ct.

Ben also confirmed in the thread that the patch was working fine on his
R7800 (QCA9984).

> > --- a/drivers/net/wireless/ath/ath10k/core.c
> > +++ b/drivers/net/wireless/ath/ath10k/core.c
> > @@ -2649,6 +2649,13 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
> >  		goto err_hif_stop;
> >  	}
> >  
> > +	status = ath10k_wmi_pdev_set_base_macaddr(ar, ar->mac_addr);
> > +	if (status) {
> > +		ath10k_err(ar,
> > +			   "failed to set base mac address: %d\n", status);
> > +		goto err_hif_stop;
> > +	}
> 
> Oh, and as the new parameter is not supported with WMI TLV interface
> (QCA6174, WCN3990 etc) this will print an error on those.

This also means that Brian won't be able to test/verify this anyway?
Should I also drop ath10k_wmi_tlv_op_gen_pdev_set_base_macaddr() then?
Because it won't make sense to have the support function if
"WMI_TLV_TAG_STRUCT_PDEV_SET_BASE_MACADDR_CMD" is just a dummy in this
context.

> I think you
> need to check for -EOPNOTSUPP and then just ignore the error on that
> case. IIRC we have similar checks elsewhere in ath10k.

Ok, I think I know what you are looking for:
| if (status && status != -EOPNOTSUPP) { ...

Yes, this should work.

Thanks,
Christian



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
