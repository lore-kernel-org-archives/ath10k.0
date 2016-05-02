Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1axI8l-0008Ji-0e
 for ath10k@lists.infradead.org; Mon, 02 May 2016 18:00:15 +0000
Subject: Re: QCA99XX with MU-MIMO and beamforming?
References: <571E7E8F.1010404@candelatech.com>
 <CA+BoTQke1auNL1-oPN-N9=e9K5vit0w2iJSS9KuXEifR7hqm6Q@mail.gmail.com>
 <571F7CB7.9090601@candelatech.com>
 <CA+BoTQmd3dzoGMckJe+1YSONjtqqtUOKWiRj-CUF6hO42DExng@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <57279584.6040809@candelatech.com>
Date: Mon, 2 May 2016 10:59:32 -0700
MIME-Version: 1.0
In-Reply-To: <CA+BoTQmd3dzoGMckJe+1YSONjtqqtUOKWiRj-CUF6hO42DExng@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 04/26/2016 11:37 PM, Michal Kazior wrote:
> On 26 April 2016 at 16:35, Ben Greear <greearb@candelatech.com> wrote:
>>
>>
>> On 04/25/2016 11:16 PM, Michal Kazior wrote:
>>>
>>> On 25 April 2016 at 22:31, Ben Greear <greearb@candelatech.com> wrote:
>>>>
>>>> Has anyone tried this?  Looks like hostapd has the ability to set the
>>>> feature flags, but I am not sure if it is really working in ath10k?
>>>
>>>
>>> Yes, it works. You need a few vht_capabs. I have mine like this:
>>>
>>>    >
>>> vht_capab=[RXLDPC][SHORT-GI-80][TX-STBC-2BY1][SU-BEAMFORMER][SU-BEAMFORMEE][MU-BEAMFORMER][RX-ANTENNA-PATTERN][TX-ANTENNA-PATTERN][BF-ANTENNA-4][MAX-MPDU-11454][RX-STBC-1][MAX-A-MPDU-LEN-EXP7]
>>>
>>> The SU-, MU- and BF- are the required part only I think.
>>>
>>>
>>>>
>>>> Do you actually need anything other than standard whip antenna to
>>>> allow this to function properly?
>>>
>>>
>>> I don't think. FWIW Make sure the antennas are reasonably set
>>> up/separated from each other. If you cram them too tight/randomly
>>> beamforming won't work efficiently. I had problem with client antennas
>>> being too close to each other and lying flat on a table (I than made a
>>> foam-stand and put them a few cm apart) so the same thing must apply
>>> to AP as well.
>>>
>>>
>>>>
>>>> What about station mode?
>>>
>>>
>>> Works as well. Both on QCA99XX and QCA9377.
>>
>>
>> Thanks for the info.  How did you determine that it actually worked?
>
> Empirically. If you get 600mbps UDP to two 1x1 clients it works :)
>
> Also, the rx bitrate on the receiving ath10k end will be kind of wierd
> (there's currently no way to decode MU ratesets on Rx because group
> ids are managed in firmware).

So, I configured 3 systems:  1 is AP, two are acting as stations.

All are 9980, but the two station systems are forced to act like
1x1.

Single station download is about 270Mbps over-the-air.  But, when I
add the second station, then total over-the-air stays at about 270Mbps.

So, I guess mu-mimo is not actually working for me.

My hostapd config looks like this (below).  Does it look right?  Do I need something
special in wpa_supplicant config on the station side?

interface=vap0
driver=nl80211
logger_syslog=-1
logger_syslog_level=2
logger_stdout=-1
logger_stdout_level=2
ctrl_interface=/var/run/hostapd
ctrl_interface_group=0
ssid=wave2-2-ssid
bssid=04:f0:21:56:6d:20
country_code=US
ieee80211d=0
ieee80211h=0
ieee80211w=0
hw_mode=a
ieee80211n=1
ieee80211ac=1
beacon_int=240
dtim_period=2
max_num_sta=2007
rts_threshold=2347
preamble=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
# Enable HT modes if you want 300Mbps+ throughput.
#ht_capab=[HT20][HT40-][HT40+][GF][SHORT-GI-20][SHORT-GI-40]
#         [TX-STBC][RX-STBC123][MAX-AMSDU-7935][DSSS_CCK-40][PSMP][LSIG-TXOP-PROT]
ht_capab=[HT20][HT40+][SHORT-GI-40][SHORT-GI-20]
vht_capab=[MAX-MPDU-11454][RXLDPC][TX-STBC-2BY1][RX-STBC-1][MAX-A-MPDU-LEN-EXP0][RX-ANTENNA-PATTERN][TX-ANTENNA-PATTERN][SU-BEAMFORMER][SU-BEAMFORMEE][MU-BEAMFORMER][SHORT-GI-80]
wmm_enabled=1
wmm_ac_bk_cwmin=4
wmm_ac_bk_cwmax=10
wmm_ac_bk_aifs=7
wmm_ac_bk_txop_limit=0
wmm_ac_bk_acm=0
wmm_ac_be_aifs=3
wmm_ac_be_cwmin=4
wmm_ac_be_cwmax=10
wmm_ac_be_txop_limit=0
wmm_ac_be_acm=0
wmm_ac_vi_aifs=2
wmm_ac_vi_cwmin=3
wmm_ac_vi_cwmax=4
wmm_ac_vi_txop_limit=94
wmm_ac_vi_acm=0
wmm_ac_vo_aifs=2
wmm_ac_vo_cwmin=2
wmm_ac_vo_cwmax=3
wmm_ac_vo_txop_limit=47
wmm_ac_vo_acm=0
### TX queue parameters
tx_queue_data3_aifs=7
tx_queue_data3_cwmin=15
tx_queue_data3_cwmax=1023
tx_queue_data3_burst=0
tx_queue_data2_aifs=3
tx_queue_data2_cwmin=15
tx_queue_data2_cwmax=63
tx_queue_data2_burst=0
tx_queue_data1_aifs=1
tx_queue_data1_cwmin=7
tx_queue_data1_cwmax=15
tx_queue_data1_burst=3.0
tx_queue_data0_aifs=1
tx_queue_data0_cwmin=3
tx_queue_data0_cwmax=7
tx_queue_data0_burst=1.5
vht_oper_centr_freq_seg0_idx=155
vht_oper_chwidth=1
channel=149
supported_rates=60 90 120 180 240 360 480 540
ieee8021x=0
eapol_key_index_workaround=0
eap_server=0
own_ip_addr=127.0.0.1
wpa=2
wpa_pairwise=TKIP CCMP
wpa_passphrase=wave2-passwd
wpa_key_mgmt=WPA-PSK WPA-PSK-SHA256

# Error emulation settings.
ignore_probe_probability=0.000000
ignore_auth_probability=0.000000
ignore_assoc_probability=0.000000
ignore_reassoc_probability=0.000000
corrupt_gtk_rekey_mic_probability=0.000000
no_pri_sec_switch=1


Thanks,
Ben



-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
