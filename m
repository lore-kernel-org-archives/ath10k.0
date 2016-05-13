Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.devolo.com ([89.1.14.71])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b1Ewx-000706-PM
 for ath10k@lists.infradead.org; Fri, 13 May 2016 15:24:25 +0000
Received: from localhost (localhost [127.0.0.1])
 by smtp.devolo.com (Postfix) with ESMTP id 4044810141C
 for <ath10k@lists.infradead.org>; Fri, 13 May 2016 17:24:01 +0200 (CEST)
Received: from smtp.devolo.com ([127.0.0.1])
 by localhost (smtp.devolo.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2R7XUvg2kWiv for <ath10k@lists.infradead.org>;
 Fri, 13 May 2016 17:23:56 +0200 (CEST)
Received: from mail.devolo.de (juno.devolo.intern [10.1.1.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.devolo.com (Postfix) with ESMTPS id D3F67105D87
 for <ath10k@lists.infradead.org>; Fri, 13 May 2016 17:23:54 +0200 (CEST)
From: Guenther Kelleter <Guenther.Kelleter@devolo.de>
Subject: RE: ath10k+hostapd: dynamic VLAN issue
Date: Fri, 13 May 2016 15:23:54 +0000
Message-ID: <EF6DF72779EE294A8A2425E8DA3BC0CC54352055@Pallas.devolo.intern>
References: <EF6DF72779EE294A8A2425E8DA3BC0CC5434F83C@Pallas.devolo.intern>
In-Reply-To: <EF6DF72779EE294A8A2425E8DA3BC0CC5434F83C@Pallas.devolo.intern>
Content-Language: de-DE
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "'ath10k@lists.infradead.org'" <ath10k@lists.infradead.org>

Hi

> -----Original Message-----
> From: ath10k [mailto:ath10k-bounces@lists.infradead.org] On Behalf Of Gue=
nther
> Kelleter
> Sent: Monday, May 09, 2016 1:02 PM
> To: 'ath10k@lists.infradead.org'
> Subject: ath10k+hostapd: dynamic VLAN issue
> =

> Hi
> =

> With OpenWrt master branch (based on hostapd
> e15dcf6d1bc2725388555523effca75b1ffab735, 2016-01-15) dynamic vlans are n=
ot
> working anymore. There seems to be an Issue introduced with hostapd commit
> 7cebc8e2100626dc6981a3f53301058452953b9b (at least the error messages I s=
ee
> were introduced with this commit).
> On OpenWrt Chaos Calmer based on hostapd 2.4 dynamic VLANs are working
> properly.
> =

> But: Failure happens with ath10k driver.
> Ath9k looks good regarding this issue: vlan_bridge is created and the tag=
ged
> wlan interface added to this bridge.
> I'm not very familiar with hostapd/mac80211 and don't know how to debug t=
his
> further or whether this is a bug in hostapd, mac80211 or ath10k...
> =

> Following is a debug log of the failure:  look for "set_key failed"
> =

> =

> Configuration file: /var/run/hostapd-phy0.conf
> [...]
> wlan0-2: STA 78:7e:61:61:15:a3 RADIUS: VLAN ID 20
> VLAN: vlan_add_dynamic(vlan_id=3D20 ifname=3Dwlan0-2.#)
> nl80211: Create interface iftype 4 (AP_VLAN)
> nl80211: Ignored event (cmd=3D7) for foreign interface (ifindex 60 wdev 0=
x0)
> nl80211: New interface wlan0-2.20 created: ifindex=3D60
> nl80211: Add own interface ifindex 60
> nl80211: if_indices[16]: 5 34 58 59 60
> nl80211: Add own interface ifindex 60
> nl80211: ifindex 60 already in the list
> VLAN: Set interface wlan0-2.20 up
> WPA: Add group state machine for VLAN-ID 20
> GMK - hexdump(len=3D32): [REMOVED]
> Key Counter - hexdump(len=3D32): [REMOVED]
> WPA: group state machine entering state GTK_INIT (VLAN-ID 20)
> GTK - hexdump(len=3D16): [REMOVED]
> IGTK - hexdump(len=3D16): [REMOVED]
> WPA: group state machine entering state SETKEYSDONE (VLAN-ID 20)
> wpa_driver_nl80211_set_key: ifindex=3D60 (wlan0-2.20) alg=3D3 addr=3D0x49=
6be4
> key_idx=3D1 set_tx=3D1 seq_len=3D0 key_len=3D16
> nl80211: KEY_DATA - hexdump(len=3D16): [REMOVED]
> =A0=A0 broadcast key
> nl80211: set_key failed; err=3D-22 Invalid argument)


I could track this failure to function net/mac80211/key.c:ieee80211_key_ena=
ble_hw_accel() of mac-80211

static int ieee80211_key_enable_hw_accel(struct ieee80211_key *key)
{
[...]
        if (sdata->vif.type =3D=3D NL80211_IFTYPE_AP_VLAN) {
                /*
                 * The driver doesn't know anything about VLAN interfaces.
                 * Hence, don't send GTKs for VLAN interfaces to the driver.
                 */
                if (!(key->conf.flags & IEEE80211_KEY_FLAG_PAIRWISE))      =
   // ! This condition is true
                        goto out_unsupported;
        }
[...]
out_unsupported:
        switch (key->conf.cipher) {
        case WLAN_CIPHER_SUITE_WEP40:
        case WLAN_CIPHER_SUITE_WEP104:
        case WLAN_CIPHER_SUITE_TKIP:
        case WLAN_CIPHER_SUITE_CCMP:
        case WLAN_CIPHER_SUITE_CCMP_256:
        case WLAN_CIPHER_SUITE_AES_CMAC:
        case WLAN_CIPHER_SUITE_BIP_CMAC_256:
        case WLAN_CIPHER_SUITE_BIP_GMAC_128:
        case WLAN_CIPHER_SUITE_BIP_GMAC_256:
        case WLAN_CIPHER_SUITE_GCMP:
        case WLAN_CIPHER_SUITE_GCMP_256:
                /* all of these we can do in software - if driver can */
                if (ret =3D=3D 1)
                        return 0;
                if (ieee80211_hw_check(&key->local->hw, SW_CRYPTO_CONTROL))=
    // ! this condition also true =

-------->               return -EINVAL;
                return 0;
        default:
                return -EINVAL;
        }
}


i.e. set_key fails because ath10k does support SW_CRYPTO_CONTROL?

ATH10k firmware is:
[   58.740000] ath10k_pci 0000:00:00.0: Direct firmware load for ath10k/cal=
-pci-0000:00:00.0.bin failed with error -2
[   58.750000] ath10k_pci 0000:00:00.0: Falling back to user helper
[   65.310000] ath10k_pci 0000:00:00.0: qca988x hw2.0 target 0x4100016c chi=
p_id 0x043202ff sub 0000:0000
[   65.320000] ath10k_pci 0000:00:00.0: kconfig debug 0 debugfs 1 tracing 1=
 dfs 1 testmode 1
[   65.340000] ath10k_pci 0000:00:00.0: firmware ver 10.2.4.70.42-2 api 5 f=
eatures no-p2p,raw-mode,mfp crc32 44f66eae
[   65.390000] ath10k_pci 0000:00:00.0: Direct firmware load for ath10k/QCA=
988X/hw2.0/board-2.bin failed with error -2
[   65.400000] ath10k_pci 0000:00:00.0: Falling back to user helper
[   65.470000] firmware ath10k!QCA988X!hw2.0!board-2.bin: firmware_loading_=
store: map pages failed
[   65.490000] ath10k_pci 0000:00:00.0: board_file api 1 bmi_id N/A crc32 b=
ebc7c08
[   66.540000] ath10k_pci 0000:00:00.0: htt-ver 2.1 wmi-op 5 htt-op 2 cal f=
ile max-sta 128 raw 0 hwcrypto 1


If I remove the following 2 lines from drivers/net/wireless/ath/ath10k/mac.=
c, set_key succeeds!

	if (!test_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags))
		ieee80211_hw_set(ar->hw, SW_CRYPTO_CONTROL);

i.e. not setting flag SW_CRYPTO_CONTROL fixes it (apparently).

This was introduced in linux commit ccec9038c7217e537f5ae5e3ac5af8293a21bbf=
d "ath10k: enable raw encap mode and software crypto engine".


Can someone shed some light on this crazy stuff?
Is it bad to disable SW_CRYPTO_CONTROL for ath10k? Or does this break crypt=
o?


Thanks
G=FCnther


> WPA: group state machine entering state FATAL_FAILURE
> WPA: Ensure group state machine running for VLAN ID 20
> WPA initialization for VLAN 20 failed (-1)
> WPA: Try stopping group state machine for VLAN ID 20
> WPA: Remove group state machine for VLAN-ID 20
> WPA deinit of wlan0-2.20 failed
> nl80211: wpa_driver_nl80211_if_remove(type=3D1 ifname=3Dwlan0-2.20) ifind=
ex=3D60
> added_if=3D1
> nl80211: Remove interface ifindex=3D60
> nl80211: if_indices[16]: 5 34 58 59
>[...}
> =

> =

> =

> =

> Regards
> G=FCnther
> =

> =

> =

> =

> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
