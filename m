Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYzuP-0005ma-IV
 for ath10k@lists.infradead.org; Wed, 01 Feb 2017 18:45:35 +0000
References: <CAHNKnsRZ6N7EuzCnKR56ER5cpRemSwgnU99CpujE-+uFaJML+w@mail.gmail.com>
 <CAJ-Vmo=yD7Ct5LFXBO3qNhKsNco91VXMmZOYeBaAuw+DFGq=RQ@mail.gmail.com>
 <CAHNKnsT8mzHefrnC4ybrR8T16dAqc4G_SDGesxdU7+81xhuYpw@mail.gmail.com>
 <CAJ-VmokwMPSg7AW-MkO4JOKKMWc_5O4w-pA2jumhChowFKo0Ug@mail.gmail.com>
 <87y3xtrmn2.fsf@kamboji.qca.qualcomm.com>
 <44480bab-0cf7-f4e3-7612-b1cf5d4c040f@dd-wrt.com>
 <1a58440c-80c9-0a86-aae9-213edc5b0019@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <ed765a12-6ae8-ed78-6626-ae82312ba525@dd-wrt.com>
Date: Wed, 1 Feb 2017 19:45:06 +0100
MIME-Version: 1.0
In-Reply-To: <1a58440c-80c9-0a86-aae9-213edc5b0019@candelatech.com>
Subject: Re: 9984 VHT
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
To: Ben Greear <greearb@candelatech.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Am 01.02.2017 um 17:48 schrieb Ben Greear:
> On 01/30/2017 02:28 AM, Sebastian Gottschall wrote:
>> Hello
>>
>> with recent 9984 firmares vht160 seem to crash the firmware itself =

>> for no reason i see.
>> is there any internal structure change in these newer firmwares we =

>> need to consider?
>> i also tested the even more recent firmware =

>> firmware-5.bin_10.4-3.4-00068 from codeaurora. this one doesnt crash =

>> but the vdev_start returns with a error
>>
>> i compared the more recent wmi headers from the qca drivers, but =

>> wasnt able to find anything which could explain the behaviour
>>
>> Sebastian
>>
>>
>
> Hello Sebastian,
>
> Could you share the hostapd/supplicant config file you are using?
>
> And, what kernel (or backports kernel) are you using?  I'd like to
> see how 160Mhz works on my firmware....
always state of art for sure

driver=3Dnl80211
ctrl_interface=3D/var/run/hostapd
wmm_ac_bk_cwmin=3D4
wmm_ac_bk_cwmax=3D10
wmm_ac_bk_aifs=3D7
wmm_ac_bk_txop_limit=3D0
wmm_ac_bk_acm=3D0
wmm_ac_be_aifs=3D3
wmm_ac_be_cwmin=3D4
wmm_ac_be_cwmax=3D10
wmm_ac_be_acm=3D0
wmm_ac_vi_aifs=3D2
wmm_ac_vi_cwmin=3D3
wmm_ac_vi_cwmax=3D4
wmm_ac_vi_txop_limit=3D94
wmm_ac_vi_acm=3D0
wmm_ac_vo_aifs=3D2
wmm_ac_vo_cwmin=3D2
wmm_ac_vo_cwmax=3D3
wmm_ac_vo_txop_limit=3D47
wmm_ac_vo_acm=3D0
tx_queue_data3_aifs=3D7
tx_queue_data3_cwmin=3D15
tx_queue_data3_cwmax=3D1023
tx_queue_data3_burst=3D0
tx_queue_data2_aifs=3D3
tx_queue_data2_cwmin=3D15
tx_queue_data2_cwmax=3D63
tx_queue_data1_aifs=3D1
tx_queue_data1_cwmin=3D7
tx_queue_data1_cwmax=3D15
tx_queue_data1_burst=3D3.0
tx_queue_data0_aifs=3D1
tx_queue_data0_cwmin=3D3
tx_queue_data0_cwmax=3D7
tx_queue_data0_burst=3D1.5
country_code=3DDE
tx_queue_data2_burst=3D2.0
wmm_ac_be_txop_limit=3D64
ieee80211n=3D1
dynamic_ht40=3D0
ht_capab=3D[HT40+][LDPC][SHORT-GI-20][SHORT-GI-40][TX-STBC][RX-STBC1][DSSS_=
CCK-40][MAX-AMSDU-7935] =


vht_capab=3D[RXLDPC][SHORT-GI-80][SHORT-GI-160][TX-STBC-2BY1][RX-STBC-1][SU=
-BEAMFORMER][SU-BEAMFORMEE][MU-BEAMFORMER][MU-BEAMFORMEE][RX-ANTENNA-PATTER=
N][TX-ANTENNA-PATTERN][MAX-MPDU-11454][MAX-A-MPDU-LEN-EXP7][BF-ANTENNA-2][S=
OUNDING-DIMENSION-2][BF-ANTENNA-3][SOUNDING-DIMENSION-3] =


ieee80211ac=3D1
vht_oper_chwidth=3D2
vht_oper_centr_freq_seg0_idx=3D114
hw_mode=3Da
channel=3D100
frequency=3D5500
beacon_int=3D100

dtim_period=3D2

interface=3Dath0
disassoc_low_ack=3D1
wds_sta=3D1
wmm_enabled=3D1
bssid=3DDC:EF:09:E4:CE:09
ignore_broadcast_ssid=3D0
max_num_sta=3D256
ssid=3DRHBRIDGE5
bridge=3Dbr0
logger_syslog=3D-1
logger_stdout=3D-1
logger_stdout_level=3D2
eapol_version=3D1
eapol_key_index_workaround=3D0
wpa=3D2
wpa_passphrase=3D***********
wpa_key_mgmt=3DWPA-PSK
wpa_pairwise=3DCCMP
wpa_group_rekey=3D3600


bss=3Dath0.1
disassoc_low_ack=3D1
wmm_enabled=3D1
bssid=3DDE:EF:09:E4:CE:09
ignore_broadcast_ssid=3D0
max_num_sta=3D256
ssid=3Dmagrathea_5ghz
bridge=3Dbr0
logger_syslog=3D-1
logger_stdout=3D-1
logger_stdout_level=3D2
eapol_version=3D1
eapol_key_index_workaround=3D0
wpa=3D2
wpa_key_mgmt=3DWPA-EAP
ieee8021x=3D1
own_ip_addr=3D172.29.0.38
eap_server=3D0
auth_algs=3D1
radius_retry_primary_interval=3D600
auth_server_addr=3D172.29.0.33
auth_server_port=3D1812
auth_server_shared_secret=3D************
wpa_pairwise=3DCCMP
wpa_group_rekey=3D3600


>
> Thanks,
> Ben
>


-- =

Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Berliner Ring 101, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
