Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grkac-0000Z8-KP
 for ath10k@lists.infradead.org; Thu, 07 Feb 2019 14:23:45 +0000
Subject: Re: [PATCH] ath10k: implement set_base_macaddr to fix rx-bssid mask
 in multiple APs conf
References: <20190114153558.972-1-chunkeey@gmail.com>
 <87tvhjd0c7.fsf@kamboji.qca.qualcomm.com> <4891660.4ehrp1WKpm@debian64>
 <87womb8yw1.fsf@kamboji.qca.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <bd92e361-f6f3-cfd9-090d-6381134edfdb@candelatech.com>
Date: Thu, 7 Feb 2019 06:23:26 -0800
MIME-Version: 1.0
In-Reply-To: <87womb8yw1.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, Christian Lamparter <chunkeey@gmail.com>
Cc: Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, Mathias Kresin <dev@kresin.me>, ath10k@lists.infradead.org, Felix Fietkau <nbd@nbd.name>



On 02/07/2019 06:19 AM, Kalle Valo wrote:
> Christian Lamparter <chunkeey@gmail.com> writes:
>
>> On Monday, February 4, 2019 4:45:12 PM CET Kalle Valo wrote:
>>> Christian Lamparter <chunkeey@gmail.com> writes:
>>>
>>>> @@ -8885,6 +8904,7 @@ static const struct wmi_ops wmi_ops = {
>>>>
>>>>  	.gen_pdev_suspend = ath10k_wmi_op_gen_pdev_suspend,
>>>>  	.gen_pdev_resume = ath10k_wmi_op_gen_pdev_resume,
>>>> +	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
>>>>  	.gen_pdev_set_rd = ath10k_wmi_op_gen_pdev_set_rd,
>>>>  	.gen_pdev_set_param = ath10k_wmi_op_gen_pdev_set_param,
>>>>  	.gen_init = ath10k_wmi_op_gen_init,
>>>> @@ -8960,6 +8980,7 @@ static const struct wmi_ops wmi_10_1_ops = {
>>>>
>>>>  	.gen_pdev_suspend = ath10k_wmi_op_gen_pdev_suspend,
>>>>  	.gen_pdev_resume = ath10k_wmi_op_gen_pdev_resume,
>>>> +	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
>>>>  	.gen_pdev_set_param = ath10k_wmi_op_gen_pdev_set_param,
>>>>  	.gen_stop_scan = ath10k_wmi_op_gen_stop_scan,
>>>>  	.gen_vdev_create = ath10k_wmi_op_gen_vdev_create,
>>>> @@ -9032,6 +9053,7 @@ static const struct wmi_ops wmi_10_2_ops = {
>>>>
>>>>  	.gen_pdev_suspend = ath10k_wmi_op_gen_pdev_suspend,
>>>>  	.gen_pdev_resume = ath10k_wmi_op_gen_pdev_resume,
>>>> +	.gen_pdev_set_base_macaddr = ath10k_wmi_op_gen_pdev_set_base_macaddr,
>>>>  	.gen_pdev_set_param = ath10k_wmi_op_gen_pdev_set_param,
>>>>  	.gen_stop_scan = ath10k_wmi_op_gen_stop_scan,
>>>>  	.gen_vdev_create = ath10k_wmi_op_gen_vdev_create,
>>>
>>> These are in practise obsolete WMI interfaces so not sure if it makes it
>>> worth to support this parameter in them. But on the other hand it won't
>>> hurt either, so dunno.
>>
>> Ok. I looked what firmware interfaces (wmi_cmd_map) supported the
>> pdev_set_base_macaddr_cmdid and all did (including the old and tlv)
>> so I added the line everywhere I could.
>> As far as the support for the old firmwares goes: I don't think
>> anybody with a current ath10k is willingly still stuck on the 10.1,
>> 10.2 firmware. So, I might as well just remove those for 10_2, 10_1 and MAIN.
>
> Yeah, that's the best. BTW I'm planning (or better hoping) to remove
> 10.1, 10.2 and main WMI interfaces altogether. They are just making
> these unnecessary complex.

My wave-1 firmware uses the 10.1 interface and it is used by a fair number of people,
so please leave that one in place.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
