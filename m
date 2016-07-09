Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLueN-00072Y-9R
 for ath10k@lists.infradead.org; Sat, 09 Jul 2016 15:58:40 +0000
Received: by mail-oi0-x233.google.com with SMTP id r2so96922793oih.2
 for <ath10k@lists.infradead.org>; Sat, 09 Jul 2016 08:58:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEFj9861s7hJOXj4H9WA4fD_JjWTUwim243AUB6dWXqO7pVNFQ@mail.gmail.com>
References: <CAGJdtRASjA_+HPh1zFkoF4V=ttWcidxEwDAOU+ehbc7YhSxw7A@mail.gmail.com>
 <CAEFj984kqhY5zM_S=CLfDdujbpmwsrKqzZx=xm1AyCPQcmWWKg@mail.gmail.com>
 <577FE767.3020200@codeaurora.org>
 <CAGJdtRDGOAo5DUp14HkJ2vr+gtkeLcOZarvYBxMnX2DeiV7_tg@mail.gmail.com>
 <CAGJdtRCzx3cG0jWfJa3HeL82bAvSotm=EofeEEg2oj8OsMZu5g@mail.gmail.com>
 <CAEFj9861s7hJOXj4H9WA4fD_JjWTUwim243AUB6dWXqO7pVNFQ@mail.gmail.com>
From: Yu-Chieh <jay0607@gmail.com>
Date: Sat, 9 Jul 2016 23:58:16 +0800
Message-ID: <CAGJdtRBDeAvMChyjRZ0wzDWYrL-eyEr-mvCU0oaa3NkaWhKGeQ@mail.gmail.com>
Subject: Re: Does 99x0 support mesh mode?
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: Peter Oh <poh@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Thanks Chun-Yeow

Try the firmware on https://github.com/kvalo/ath10k-firmware
the firmware still not support RAW mode

Jay

2016-07-09 23:15 GMT+08:00 Yeoh Chun-Yeow <yeohchunyeow@gmail.com>:
> Take a look on the firmware here for your hardware and see how:
> https://github.com/kvalo/ath10k-firmware
>
> Regards,
> Chun-Yeow
>
> On Sat, Jul 9, 2016 at 11:25 AM, Yu-Chieh <jay0607@gmail.com> wrote:
>> OK, i think it's not supported now
>> # iw phy phy0 interface add mp0 type mp mesh_id MeshNetwork
>> # ifconfig mp0 up
>> [  289.502405] ath10k_pci 0003:01:00.0: 10.4 wmi init: vdevs: 16  peers: 528  ti
>> d: 132
>> [  289.510058] ath10k_pci 0003:01:00.0: msdu-desc: 1424  skid: 32
>> [  289.604802] ath10k_pci 0003:01:00.0: must load driver with rawmode=1 to add m
>> esh interfaces
>> ifconfig: SIOCSIFFLAGS: Invalid argument
>>
>> then, i tried insmod ath10k_core.ko with rawmode=1, i got probe fw
>> fail log as following
>> [  350.779002] ath10k_pci 0003:01:00.0: rawmode = 1 requires support from firmwa
>> re
>> [  350.786294] ath10k_pci 0003:01:00.0: fatal problem with firmware features: -2
>> 2
>> [  350.793575] ath10k_pci 0003:01:00.0: could not probe fw (-22)
>>
>> Jay
>>
>> 2016-07-09 10:57 GMT+08:00 Yu-Chieh <jay0607@gmail.com>:
>>> i have checked firmware firmware-5.bin_10.4.3.00063-1 on codeaurora
>>>
>>> regarding ram mode, i think it's not supported
>>> <6>[232109.383248] ath10k_pci 0003:01:00.0: firmware ver 10.4.3.00063
>>> api 5 features no-p2p,peer-flow-ctrl crc32 a0d385ce
>>> <6>[232110.836979] ath10k_pci 0003:01:00.0: board_file api 1 bmi_id
>>> 1:1 crc32 77b2338a
>>> <4>[232113.369117] ath10k_pci 0003:01:00.0: 10.4 wmi init: vdevs: 16
>>> peers: 528  tid: 132
>>> <4>[232113.376857] ath10k_pci 0003:01:00.0: msdu-desc: 1424  skid: 32
>>> <6>[232113.452238] ath10k_pci 0003:01:00.0: htt-ver 2.2 wmi-op 6
>>> htt-op 4 cal otp max-sta 512 raw 0 hwcrypto 1
>>>
>>> regarding wmi_service, i have checked
>>> /sys/kernel/debug/ieee80211/phy0/ath10k/wmi_services
>>> WMI_SERVICE_MESH_11S                     -
>>> WMI_SERVICE_MESH_NON_11S                 enabled
>>>
>>> Any one knows MESH_NON_11S ?
>>>
>>> Jay
>>>
>>> 2016-07-09 1:48 GMT+08:00 Peter Oh <poh@codeaurora.org>:
>>>>
>>>> On 07/08/2016 10:15 AM, Yeoh Chun-Yeow wrote:
>>>>>
>>>>> Make sure the firmware has the raw mode feature bit enabled to support
>>>>> mesh.
>>>>
>>>> In addition to that, you may check out wmi_services (cat
>>>> /sys/kernel/debug/ieee80211/phyX/ath10k/wmi_services) if
>>>> WMI_SERVICE_MESH_11S is set to enabled which means 11s mesh supported in
>>>> native Wi-Fi mode.
>>>>
>>>>> ---
>>>>> Chun-Yeow
>>>>>
>>>>> On Fri, Jul 8, 2016 at 12:52 PM, Yu-Chieh <jay0607@gmail.com> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> Does anyone know if current firmware support mesh mode(802.11s) on 99x0?
>>>>>>
>>>>>> Best regards,
>>>>>>
>>>>>> Jay
>>>>>>
>>>>>> _______________________________________________
>>>>>> ath10k mailing list
>>>>>> ath10k@lists.infradead.org
>>>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>>
>>>>>
>>>> Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
