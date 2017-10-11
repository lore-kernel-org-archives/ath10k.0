Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-he1eur01on0089.outbound.protection.outlook.com
 ([104.47.0.89] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e2LTh-0006R0-2D
 for ath10k@lists.infradead.org; Wed, 11 Oct 2017 18:11:35 +0000
Subject: Re: mesh point and ap mode on same interface
References: <e6b02c56-38c7-323e-2bc9-e2b4276b654c@tu-bs.de>
 <cc8baced-bd74-5703-d885-6ec444eb62ce@candelatech.com>
 <43bf6a27-be58-35e4-26fa-5e6b380353ac@bowerswilkins.com>
 <7dc592a5-9381-f715-6ea7-0a8b8deee311@tu-bs.de>
 <CADjYELwdUxEap_z=_HD4DS4FEQ2_2HP3w9cvDU-BTFLoOTDipg@mail.gmail.com>
 <5c04c7fe-8cf8-ddd8-d6a7-f42629586a63@bowerswilkins.com>
 <067d234a-59f0-4175-55af-9354617057b9@tu-bs.de>
From: Peter Oh <peter.oh@bowerswilkins.com>
Message-ID: <61192d3b-b4c7-f47e-2ff9-44e17595d6a9@bowerswilkins.com>
Date: Wed, 11 Oct 2017 11:10:56 -0700
MIME-Version: 1.0
In-Reply-To: <067d234a-59f0-4175-55af-9354617057b9@tu-bs.de>
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
To: Hannes Harms <hannes.harms@tu-bs.de>, Thomas Pedersen <thomas@eero.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org



On 10/10/2017 06:04 AM, Hannes Harms wrote:
>
>> On 10/09/2017 08:08 AM, Thomas Pedersen wrote:
>>> On Oct 9, 2017 1:46 AM, "Harms, Hannes" <hannes.harms@tu-bs.de 
>>> <mailto:hannes.harms@tu-bs.de>> wrote:
>>>
>>>     On 10/06/2017 20:18, Peter, Oh wrote
>>>
>>>         I have tried t bring up the ap interface with iw / hostapd,
>>>
>>>                 after joining the mesh.
>>>
>>>                 When I start the second interface, rtnetlink
>>>                 responds with
>>>                 device or resource busy.
>>>
>>>
>>>         If you give more details of your steps, people may help you
>>>         more.
>>>         Btw, did you create a 2nd interface on the same radio and
>>>         change the mac address?
>>>
>>>
>>>     Yes,  I changed the mac of the 2nd interface:
>>>
>>>     The mesh setup:
>>>
>>>     > brctl addbr mesh-bridge
>>>     > iw phy0 interface add wlan0 type mp mesh_id my_mesh
>>>     > iw wlan0 set freq 5500 80 5530
>>>     > ip link set dev wlan0 up
>>>     > iw wlan0 mesh join my_mesh
>>>     > brctl addif  mesh-bridge mesh0
>>>
>> Are you sure this configuration is what you're using?
>> there is no way to use DFS channels on mesh via iw at this moment.
>> and mesh id on brctl addif is different from interface add.
>>
>>>     The ap interface:
>>>
>>>     > iw dev wlan0 interface add virtual_ap type __ap
>>>     > ip link set dev virtual_ap address 04:f0:21:1b:7b:48
>>>     > hostapd -B -dd hostapd.conf
>>>
>> hostapd also does not allow interface to use DFS channels without 
>> country_code parameter.
>>>
>>>     I think mesh and AP channel frequency + width need to match.
>>>
> Yes, you are right with the dfs channels,
> I was testing with some relaxed reg rules.
>
> However,  I  am still facing the original problem.
> For example if i run the following, the mesh is working (80Mhz),
> but ap does not come up.
>
> > iw phy0 interface add mesh0 type mp
> > ip link set dev mesh0 up
> > iw dev mesh0 mesh join "my_mesh" freq 5180 80MHz
> > sleep 5
> > iw phy0 interface add virtual_ap type __ap
> > ip link set dev virtual_ap address 04:f0:21:1b:7b:48
> > hostapd -B -dd hostapd.conf
>
> hostapd config:
> interface=virtual_ap
> ctrl_interface=/var/run/hostapd
> driver=nl80211
> ssid=test
> hw_mode=a
> channel=36
> ht_capab=[HT40+]
> ieee80211n=1
> ieee80211ac=1
> vht_oper_chwidth=1
> vht_oper_centr_freq_seg0_idx=42
> country_code=US
> bridge=mesh-bridge
>
Since I don't have QCA9880 products, I'm not able to run it on the chip, 
but the same steps using the same configurations work for me on QCA4019 
based product.
since EBUSY most likely comes from cfg80211, you better trace down the 
codes where the error comes.
> I also tried to join the mesh after the ap interface.
> In this case the ap is running, but joining the mesh fails
> with the same error. (device or resoure busy)
>
> thanks for your help & patience


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
