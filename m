Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-db5eur01on0080.outbound.protection.outlook.com
 ([104.47.2.80] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1dW6-00074C-Ea
 for ath10k@lists.infradead.org; Mon, 09 Oct 2017 19:15:12 +0000
Subject: Re: mesh point and ap mode on same interface
References: <e6b02c56-38c7-323e-2bc9-e2b4276b654c@tu-bs.de>
 <cc8baced-bd74-5703-d885-6ec444eb62ce@candelatech.com>
 <43bf6a27-be58-35e4-26fa-5e6b380353ac@bowerswilkins.com>
 <7dc592a5-9381-f715-6ea7-0a8b8deee311@tu-bs.de>
 <CADjYELwdUxEap_z=_HD4DS4FEQ2_2HP3w9cvDU-BTFLoOTDipg@mail.gmail.com>
 <5c04c7fe-8cf8-ddd8-d6a7-f42629586a63@bowerswilkins.com>
From: Peter Oh <peter.oh@bowerswilkins.com>
Message-ID: <fb33ed4b-a4dc-e8d7-df09-be2b09d266bf@bowerswilkins.com>
Date: Mon, 9 Oct 2017 12:14:32 -0700
MIME-Version: 1.0
In-Reply-To: <5c04c7fe-8cf8-ddd8-d6a7-f42629586a63@bowerswilkins.com>
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
To: Thomas Pedersen <thomas@eero.com>, "Harms, Hannes" <hannes.harms@tu-bs.de>
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org



On 10/09/2017 12:07 PM, Peter Oh wrote:
>
>
>
> On 10/09/2017 08:08 AM, Thomas Pedersen wrote:
>> On Oct 9, 2017 1:46 AM, "Harms, Hannes" <hannes.harms@tu-bs.de 
>> <mailto:hannes.harms@tu-bs.de>> wrote:
>>
>>     On 10/06/2017 20:18, Peter, Oh wrote
>>
>>         I have tried t bring up the ap interface with iw / hostapd,
>>
>>                 after joining the mesh.
>>
>>                 When I start the second interface, rtnetlink responds
>>                 with
>>                 device or resource busy.
>>
>>
>>         If you give more details of your steps, people may help you more.
>>         Btw, did you create a 2nd interface on the same radio and
>>         change the mac address?
>>
>>
>>     Yes,  I changed the mac of the 2nd interface:
>>
>>     The mesh setup:
>>
>>     > brctl addbr mesh-bridge
>>     > iw phy0 interface add wlan0 type mp mesh_id my_mesh
>>     > iw wlan0 set freq 5500 80 5530
>>     > ip link set dev wlan0 up
>>     > iw wlan0 mesh join my_mesh
>>     > brctl addif  mesh-bridge mesh0
>>
> Are you sure this configuration is what you're using?
> there is no way to use DFS channels on mesh via iw at this moment.
> and mesh id on brctl addif is different from interface add.
>
>>     The ap interface:
>>
>>     > iw dev wlan0 interface add virtual_ap type __ap
>>     > ip link set dev virtual_ap address 04:f0:21:1b:7b:48
>>     > hostapd -B -dd hostapd.conf
>>
> hostapd also does not allow interface to use DFS channels without 
> country_code parameter.
>>
>>     I think mesh and AP channel frequency + width need to match. Try
>>     joining mesh after brining up AP and he should adopt AP's channel
>>     configuration. Or make AP VHT80 as well.
>>
>>
> This is good thing to try out.
> But as long as you're configuration is correct such as channel number 
> and interface name, your steps should work.
>>
>>     the  hostapd config:
>>
>>     interface=virtual_ap
>>     #ctrl_interface=/var/run/hostapd
>>     driver=nl80211
>>     ssid=infra
>>     hw_mode=a
>>     channel=100
>>     ht_capab=[HT40+]
>>     ieee80211n=1
>>     ieee80211ac=1
>>     vht_oper_chwidth=1
>>     vht_oper_centr_freq_seg0_idx=106
>>     bridge=mesh-bridge
>>
>>     The 2nd interface is not running.  (device or resource busy)
>>     What I do not understand is, that according to
>>     http://lists.infradead.org/pipermail/ath10k/2016-September/008374.html
>>     <http://lists.infradead.org/pipermail/ath10k/2016-September/008374.html>
>>     mesh + ap seems possible, even with some stock firmware versions.
>>
>>
>>     _______________________________________________
>>     ath10k mailing list
>>     ath10k@lists.infradead.org <mailto:ath10k@lists.infradead.org>
>>     http://lists.infradead.org/mailman/listinfo/ath10k
>>     <http://lists.infradead.org/mailman/listinfo/ath10k>
>>
>>
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
