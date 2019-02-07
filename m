Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grkWK-00075y-2Z
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 14:19:22 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: implement set_base_macaddr to fix rx-bssid mask
 in multiple APs conf
References: <20190114153558.972-1-chunkeey@gmail.com>
 <87tvhjd0c7.fsf@kamboji.qca.qualcomm.com>
 <4891660.4ehrp1WKpm@debian64>
Date: Thu, 07 Feb 2019 16:19:10 +0200
In-Reply-To: <4891660.4ehrp1WKpm@debian64> (Christian Lamparter's message of
 "Mon, 04 Feb 2019 19:10:38 +0100")
Message-ID: <87womb8yw1.fsf@kamboji.qca.qualcomm.com>
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

> On Monday, February 4, 2019 4:45:12 PM CET Kalle Valo wrote:
>> Christian Lamparter <chunkeey@gmail.com> writes:
>> 
>> > @@ -8885,6 +8904,7 @@ static const struct wmi_ops wmi_ops = {
>> >  
>> >  	.gen_pdev_suspend = ath10k_wmi_op_gen_pdev_suspend,
>> >  	.gen_pdev_resume = ath10k_wmi_op_gen_pdev_resume,
>> > +	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
>> >  	.gen_pdev_set_rd = ath10k_wmi_op_gen_pdev_set_rd,
>> >  	.gen_pdev_set_param = ath10k_wmi_op_gen_pdev_set_param,
>> >  	.gen_init = ath10k_wmi_op_gen_init,
>> > @@ -8960,6 +8980,7 @@ static const struct wmi_ops wmi_10_1_ops = {
>> >  
>> >  	.gen_pdev_suspend = ath10k_wmi_op_gen_pdev_suspend,
>> >  	.gen_pdev_resume = ath10k_wmi_op_gen_pdev_resume,
>> > +	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
>> >  	.gen_pdev_set_param = ath10k_wmi_op_gen_pdev_set_param,
>> >  	.gen_stop_scan = ath10k_wmi_op_gen_stop_scan,
>> >  	.gen_vdev_create = ath10k_wmi_op_gen_vdev_create,
>> > @@ -9032,6 +9053,7 @@ static const struct wmi_ops wmi_10_2_ops = {
>> >  
>> >  	.gen_pdev_suspend = ath10k_wmi_op_gen_pdev_suspend,
>> >  	.gen_pdev_resume = ath10k_wmi_op_gen_pdev_resume,
>> > +	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
>> >  	.gen_pdev_set_param = ath10k_wmi_op_gen_pdev_set_param,
>> >  	.gen_stop_scan = ath10k_wmi_op_gen_stop_scan,
>> >  	.gen_vdev_create = ath10k_wmi_op_gen_vdev_create,
>> 
>> These are in practise obsolete WMI interfaces so not sure if it makes it
>> worth to support this parameter in them. But on the other hand it won't
>> hurt either, so dunno.
>
> Ok. I looked what firmware interfaces (wmi_cmd_map) supported the 
> pdev_set_base_macaddr_cmdid and all did (including the old and tlv)
> so I added the line everywhere I could.
> As far as the support for the old firmwares goes: I don't think
> anybody with a current ath10k is willingly still stuck on the 10.1,
> 10.2 firmware. So, I might as well just remove those for 10_2, 10_1 and MAIN. 

Yeah, that's the best. BTW I'm planning (or better hoping) to remove
10.1, 10.2 and main WMI interfaces altogether. They are just making
these unnecessary complex.

>> > @@ -9115,6 +9137,7 @@ static const struct wmi_ops wmi_10_2_4_ops = {
>> >  	.gen_peer_create = ath10k_wmi_op_gen_peer_create,
>> >  	.gen_peer_delete = ath10k_wmi_op_gen_peer_delete,
>> >  	.gen_peer_flush = ath10k_wmi_op_gen_peer_flush,
>> > +	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
>> >  	.gen_peer_set_param = ath10k_wmi_op_gen_peer_set_param,
>> >  	.gen_set_psmode = ath10k_wmi_op_gen_set_psmode,
>> >  	.gen_set_sta_ps = ath10k_wmi_op_gen_set_sta_ps,
>> 
>> This is only used by QCA988X. Did you test with that? If not, IMHO
>> better not to enable it for 10.2.4 until it's tested.
>
> Yes. I tested it on a CUS-223 with 10.2.4-1.0-00041 and after. I also know
> that Mathias Kresin tested it on his Homehub 5a Router (QCA9880) with both
> ath10k (most likely with the same 10.2.4-1.0-00041) and Ben's ath10k-ct.
>
> Ben also confirmed in the thread that the patch was working fine on his
> R7800 (QCA9984).

Great. And I see that you added that to the commit log in v2 already.

>> > --- a/drivers/net/wireless/ath/ath10k/core.c
>> > +++ b/drivers/net/wireless/ath/ath10k/core.c
>> > @@ -2649,6 +2649,13 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
>> >  		goto err_hif_stop;
>> >  	}
>> >  
>> > +	status = ath10k_wmi_pdev_set_base_macaddr(ar, ar->mac_addr);
>> > +	if (status) {
>> > +		ath10k_err(ar,
>> > +			   "failed to set base mac address: %d\n", status);
>> > +		goto err_hif_stop;
>> > +	}
>> 
>> Oh, and as the new parameter is not supported with WMI TLV interface
>> (QCA6174, WCN3990 etc) this will print an error on those.
>
> This also means that Brian won't be able to test/verify this anyway?
> Should I also drop ath10k_wmi_tlv_op_gen_pdev_set_base_macaddr() then?

Yes, and I see that you already did :)

> Because it won't make sense to have the support function if
> "WMI_TLV_TAG_STRUCT_PDEV_SET_BASE_MACADDR_CMD" is just a dummy in this
> context.
>
>> I think you
>> need to check for -EOPNOTSUPP and then just ignore the error on that
>> case. IIRC we have similar checks elsewhere in ath10k.
>
> Ok, I think I know what you are looking for:
> | if (status && status != -EOPNOTSUPP) { ...

> Yes, this should work.

Yup, this is what I meant.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
