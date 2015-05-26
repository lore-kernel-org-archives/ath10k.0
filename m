Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yx9Fs-0005t5-46
 for ath10k@lists.infradead.org; Tue, 26 May 2015 07:26:29 +0000
References: <55636088.1080506@dd-wrt.com> <55636198.8020802@candelatech.com>
 <55637637.8020103@dd-wrt.com> <556378E3.7050707@candelatech.com>
 <55639395.6070207@dd-wrt.com> <5563A491.8070701@candelatech.com>
 <5563A990.5000606@dd-wrt.com> <5563B357.9060309@candelatech.com>
 <5563B934.5050306@dd-wrt.com>
 <CA+BoTQmmjnyei4LGzEU9=68QkgGY6Rn08X8=TP7R6qQBzvMAEQ@mail.gmail.com>
 <20150526062009.GA14525@qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <55642010.2070902@dd-wrt.com>
Date: Tue, 26 May 2015 09:26:08 +0200
MIME-Version: 1.0
In-Reply-To: <20150526062009.GA14525@qca.qualcomm.com>
Subject: Re: possible memory leak or memory waste
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, Michal Kazior <michal.kazior@tieto.com>
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

good point. ath10k is configured with one additional vap for me. but not 
multi client.
both vap's are running in ap mode. let me send you my hostapd config here.
passphrases has been masked


driver=nl80211
ctrl_interface=/var/run/hostapd
wmm_ac_bk_cwmin=4
wmm_ac_bk_cwmax=10
wmm_ac_bk_aifs=7
wmm_ac_bk_txop_limit=0
wmm_ac_bk_acm=0
wmm_ac_be_aifs=3
wmm_ac_be_cwmin=4
wmm_ac_be_cwmax=10
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
tx_queue_data3_aifs=7
tx_queue_data3_cwmin=15
tx_queue_data3_cwmax=1023
tx_queue_data3_burst=0
tx_queue_data2_aifs=3
tx_queue_data2_cwmin=15
tx_queue_data2_cwmax=63
tx_queue_data1_aifs=1
tx_queue_data1_cwmin=7
tx_queue_data1_cwmax=15
tx_queue_data1_burst=3.0
tx_queue_data0_aifs=1
tx_queue_data0_cwmin=3
tx_queue_data0_cwmax=7
tx_queue_data0_burst=1.5
country_code=DE
tx_queue_data2_burst=2.0
wmm_ac_be_txop_limit=64
ieee80211n=1
dynamic_ht40=0
ht_capab=[HT40+][LDPC][SHORT-GI-20][SHORT-GI-40][TX-STBC][RX-STBC1][DSSS_CCK-40]
vht_capab=[RXLDPC][SHORT-GI-80][TX-STBC-2BY1][RX-STBC1][RX-ANTENNA-PATTERN][TX-ANTENNA-PATTERN][MAX-MPDU-11454][MAX-A-MPDU-LEN-EXP7]
ieee80211ac=1
vht_oper_chwidth=1
vht_oper_centr_freq_seg0_idx=106
hw_mode=a
channel=100
frequency=5500
beacon_int=100

dtim_period=2

interface=ath1
disassoc_low_ack=1
wds_sta=1
wmm_enabled=1
bssid=E8:CC:18:FF:E0:A4
ignore_broadcast_ssid=0
max_num_sta=256
ssid=dd-wrt-NA-5
bridge=br0
logger_syslog=-1
logger_syslog_level=2
logger_stdout=-1
logger_stdout_level=2
dump_file=/tmp/hostapd.dump
eapol_version=1
eapol_key_index_workaround=0
wpa=2
wpa_passphrase=***********
wpa_key_mgmt=WPA-PSK
wpa_pairwise=CCMP
wpa_group_rekey=3600


bss=ath1.1
disassoc_low_ack=1
wmm_enabled=1
bssid=EA:CC:18:FF:E0:A4
ignore_broadcast_ssid=0
max_num_sta=256
ssid=dd-wrt-TV
bridge=br0
logger_syslog=-1
logger_syslog_level=2
logger_stdout=-1
logger_stdout_level=2
dump_file=/tmp/hostapd.dump
eapol_version=1
eapol_key_index_workaround=0
wpa=2
wpa_passphrase=************
wpa_key_mgmt=WPA-PSK
wpa_pairwise=CCMP
wpa_group_rekey=3600



Am 26.05.2015 um 08:20 schrieb Rajkumar Manoharan:
> On Tue, May 26, 2015 at 07:42:35AM +0200, Michal Kazior wrote:
>> On 26 May 2015 at 02:07, Sebastian Gottschall <s.gottschall@dd-wrt.com> wrote:
>>> Am 26.05.2015 um 01:42 schrieb Ben Greear:
>>>> Can you test with ath9k to make sure it is actually ath10k related?
>>> already tested. this device has 2 chipsets. one is ath9k based and the
>>> second is ath10k based. :-)
>>> only if i kill the hostapd process which controls ath10k. the memory waste
>>> is gone
>> Keep in mind that hostapd itself requires memory to function as well.
>> Each process (and thread) need some internal kernel memory (stack, et
>> al).
>>
> Have seen simialar issue long hours run in mbssid mode with multi-client.
> Killing hostapd regains memory.
>
> [<c021dd44>] (unwind_backtrace) from [<c021ae0c>] (show_stack+0x10/0x14)
> [<c021ae0c>] (show_stack) from [<c0336b9c>] (dump_stack+0x88/0xcc)
> [<c0336b9c>] (dump_stack) from [<c0279804>] (dump_header.isra.11+0x64/0x178)
> [<c0279804>] (dump_header.isra.11) from [<c0279b10>] (oom_kill_process+0x70/0x384)
> [<c0279b10>] (oom_kill_process) from [<c027a2a0>] (out_of_memory+0x2d4/0x304)
> [<c027a2a0>] (out_of_memory) from [<c027d180>] (__alloc_pages_nodemask+0x608/0x664)
> [<c027d180>] (__alloc_pages_nodemask) from [<c0278780>] (filemap_fault+0x1f8/0x390)
> [<c0278780>] (filemap_fault) from [<c028f45c>] (__do_fault+0xa4/0x42c)
> [<c028f45c>] (__do_fault) from [<c0292494>] (handle_mm_fault+0x230/0x7b0)
> [<c0292494>] (handle_mm_fault) from [<c021f70c>] (do_page_fault+0x114/0x26c)
> [<c021f70c>] (do_page_fault) from [<c0208440>] (do_PrefetchAbort+0x34/0x98)
>
> Need to check whether it is a regression or not.
>
> -Rajkumar
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
