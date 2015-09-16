Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcBtu-0004zp-0a
 for ath10k@lists.infradead.org; Wed, 16 Sep 2015 12:33:26 +0000
Received: by igcrk20 with SMTP id rk20so33670482igc.1
 for <ath10k@lists.infradead.org>; Wed, 16 Sep 2015 05:33:04 -0700 (PDT)
Date: Wed, 16 Sep 2015 08:32:44 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: Re: [PATCH 3/3] ath10k: implement mesh support
Message-ID: <20150916123244.GA2051@localhost>
References: <1440673024-13696-1-git-send-email-me@bobcopeland.com>
 <1440673024-13696-4-git-send-email-me@bobcopeland.com>
 <87oahc9g9h.fsf@kamboji.qca.qualcomm.com>
 <87fv2o9cvl.fsf@kamboji.qca.qualcomm.com>
 <20150909164945.GA4062@localhost>
 <1441869764.2108.1.camel@sipsolutions.net>
 <55F7C6FF.3050802@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55F7C6FF.3050802@codeaurora.org>
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
To: Peter Oh <poh@codeaurora.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org

On Tue, Sep 15, 2015 at 12:21:35AM -0700, Peter Oh wrote:
> Can we configure mesh point with hostapd or can we use mesh point without
> neither wpa_supplicant nor hostapd?
> Currently I'm trying to bring up mesh point, but whenever I run hostpad
> after creating mesh point (iw phy0 interface add mesh type mp), hostapd
> change the interface mode to managed.

Hostapd can't control the mesh interface, but wpa_supplicant can,
though I believe there's a little more work needed to support VHT for
mesh in wpa_supplicant.  If you want to run an unencrypted mesh, you can
start it with iw and the kernel will run the peering manager.

If you're asking about a mesh-enabled access point, you can run hostapd
separately from wpa_supplicant/iw, as in the below script.

(I've only tested that you can bring this up on ath10k, not actual
operation, though it should work as far as I know.  I've run similar
scripts on ath9k.)

#!/bin/bash -x
#
# Example of running a mesh-enabled access point with one radio.
#
killall hostapd > /dev/null
killall wpa_supplicant > /dev/null

pubip=`ip route get 8.8.8.8 | awk 'NR==1 {print $NF}'`
last8=`echo $pubip | awk -F . '{print $4}'`
meship=10.10.1.$last8
iface=wlan0
ap_iface=ap0
br_iface=br0
mesh_mac=42:00:00:00:00:`printf "%.2x" $last8`
channel=36
freq=5180

brctl delbr $br_iface
brctl addbr $br_iface

# add a new interface for ap operation
iw dev $ap_iface del
iw dev $iface interface add $ap_iface type managed
ip addr flush $ap_iface
ip link set $ap_iface down

# create hostapd conf for ath10k
cat <<__EOM > hostapd.conf
interface=$ap_iface
driver=nl80211
ssid=mesh-ap
hw_mode=a
channel=$channel
auth_algs=3
own_ip_addr=$meship
wpa=1
wpa_passphrase=my_password
wpa_key_mgmt=WPA-PSK
wpa_pairwise=CCMP
ht_capab=[HT40+]
ieee80211n=1
ieee80211ac=1
vht_oper_chwidth=1
vht_oper_centr_freq_seg0_idx=$((channel + 6))
bridge=$br_iface
__EOM

# configure main interface to run in mesh mode
ip addr flush $iface
ip link set $iface down
ip link set addr $mesh_mac dev $iface
iw dev $iface set type mp
ip link set $iface up

# start the mesh
# here you might instead run wpa_supplicant for an encrypted mesh
iw dev $iface set freq $freq 80 $((freq + 30))
iw dev $iface mesh join mesh-vht

sleep 5

# add mesh to bridge (hostapd adds AP interface to bridge)
brctl addif $br_iface $iface
ip addr add $meship/24 dev $br_iface
ip link set $br_iface up

# run hostapd
hostapd -dd hostapd.conf >hostapd.log 2>&1 &

-- 
Bob Copeland %% http://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
