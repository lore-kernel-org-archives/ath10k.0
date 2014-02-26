Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WInBO-0002Zx-Tq
 for ath10k@lists.infradead.org; Wed, 26 Feb 2014 22:42:31 +0000
Message-ID: <530E6DBF.4060407@candelatech.com>
Date: Wed, 26 Feb 2014 14:42:07 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Anyone have a working hostapd conf file for AC?
References: <530D128B.3030509@candelatech.com>
 <87sir5kc5t.fsf@kamboji.qca.qualcomm.com> <530E2873.8000506@candelatech.com>
In-Reply-To: <530E2873.8000506@candelatech.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k <ath10k@lists.infradead.org>

For completeness, I'm adding the config that works for me below.

With this I can get around 380Mbps TCP throughput downloading,
over the air, using the .467 firmware.  I have not yet tried to
do any significant tuning to improve this throughput.

Part of my earlier problems was that I had a patch to ath10k
that enabled raw rx mode, and that at least partially breaks
AP mode (I think standard firmware probably cannot deal with
tx mode of different type from rx mode).
I just fixed my code to not enable that feature on standard firmware.


interface=vap1
driver=nl80211
logger_syslog=-1
logger_syslog_level=2
logger_stdout=-1
logger_stdout_level=2
dump_file=/home/lanforge/wifi/hostapd_vap1.dump
ctrl_interface=/var/run/hostapd
ctrl_interface_group=0
ssid=ben-ath10k
bssid=00:2e:ec:56:6c:95
country_code=US
ieee80211d=0
hw_mode=a
ieee80211n=1
ieee80211ac=1
beacon_int=240
dtim_period=2
max_num_sta=2007
rts_threshold=2347
fragm_threshold=2346
preamble=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
# Enable HT modes if you want 300Mbps+ throughput.
#ht_capab=[HT20][HT40-][HT40+][GF][SHORT-GI-20][SHORT-GI-40]
#         [TX-STBC][RX-STBC123][MAX-AMSDU-7935][DSSS_CCK-40][PSMP][LSIG-TXOP-PROT]
ht_capab=[HT20][HT40+][SHORT-GI-40][SHORT-GI-20]
vht_capab=[MAX-MPDU-11454][MAX-A-MPDU-LEN-EXP0][SHORT-GI-80]
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
channel=36
vht_oper_centr_freq_seg0_idx=42
vht_oper_chwidth=1
ieee8021x=0
eapol_key_index_workaround=0
eap_server=0
own_ip_addr=127.0.0.1

# Error emulation settings.
ignore_probe_probability=0.000000
ignore_auth_probability=0.000000
ignore_assoc_probability=0.000000
ignore_reassoc_probability=0.000000
corrupt_gtk_rekey_mic_probability=0.000000


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
