Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailfront3.rz.tu-bs.de ([134.169.12.134] helo=tu-bs.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1Thi-0004Bm-8G
 for ath10k@lists.infradead.org; Mon, 09 Oct 2017 08:46:29 +0000
Subject: Re: mesh point and ap mode on same interface
References: <e6b02c56-38c7-323e-2bc9-e2b4276b654c@tu-bs.de>
 <cc8baced-bd74-5703-d885-6ec444eb62ce@candelatech.com>
 <43bf6a27-be58-35e4-26fa-5e6b380353ac@bowerswilkins.com>
From: "Harms, Hannes" <hannes.harms@tu-bs.de>
Message-ID: <7dc592a5-9381-f715-6ea7-0a8b8deee311@tu-bs.de>
Date: Mon, 9 Oct 2017 10:47:14 +0200
MIME-Version: 1.0
In-Reply-To: <43bf6a27-be58-35e4-26fa-5e6b380353ac@bowerswilkins.com>
Content-Language: en-GB
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Peter Oh <peter.oh@bowerswilkins.com>, Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

On 10/06/2017 20:18, Peter, Oh wrote
> I have tried t bring up the ap interface with iw / hostapd,
>>> after joining the mesh.
>>>
>>> When I start the second interface, rtnetlink responds with
>>> device or resource busy.
>>
> If you give more details of your steps, people may help you more.
> Btw, did you create a 2nd interface on the same radio and change the =

> mac address?
>
>
Yes,=A0 I changed the mac of the 2nd interface:

The mesh setup:

 > brctl addbr mesh-bridge
 > iw phy0 interface add wlan0 type mp mesh_id my_mesh
 > iw wlan0 set freq 5500 80 5530
 > ip link set dev wlan0 up
 > iw wlan0 mesh join my_mesh
 > brctl addif=A0 mesh-bridge mesh0

The ap interface:

 > iw dev wlan0 interface add virtual_ap type __ap
 > ip link set dev virtual_ap address 04:f0:21:1b:7b:48
 > hostapd -B -dd hostapd.conf

the=A0 hostapd config:

interface=3Dvirtual_ap
#ctrl_interface=3D/var/run/hostapd
driver=3Dnl80211
ssid=3Dinfra
hw_mode=3Da
channel=3D100
ht_capab=3D[HT40+]
ieee80211n=3D1
ieee80211ac=3D1
vht_oper_chwidth=3D1
vht_oper_centr_freq_seg0_idx=3D106
bridge=3Dmesh-bridge

The 2nd interface is not running.=A0 (device or resource busy)
What I do not understand is, that according to
http://lists.infradead.org/pipermail/ath10k/2016-September/008374.html
mesh + ap seems possible, even with some stock firmware versions.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
