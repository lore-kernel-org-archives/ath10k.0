Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
From: "Nagarajan, Ashok Raj" <arnagara@qti.qualcomm.com>
Subject: RE: ath10k firmware crashes in mesh mode on QCA9880
Date: Mon, 5 Dec 2016 19:24:08 +0000
Message-ID: <d8eb0ba5828d43dd83030247ba443b88@aphydexm01f.ap.qualcomm.com>
References: <583DD564.8040704@cococorp.com>
 <20161201070908.GB11953@atheros-ThinkPad-T61> <58421FA2.2020004@cococorp.com>
 <20161203124358.GB31861@atheros-ThinkPad-T61>
 <20161203124600.GC31861@atheros-ThinkPad-T61> <5845B325.6060002@cococorp.com>
In-Reply-To: <5845B325.6060002@cococorp.com>
Content-Language: en-US
MIME-Version: 1.0
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
To: Benjamin Morgan <bmorgan@cococorp.com>, Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "lede-dev@lists.infradead.org" <lede-dev@lists.infradead.org>, "agreen@cococorp.com" <agreen@cococorp.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>> Applied the patch and tried with 10.2.4.70.54 firmware and it still crashes:

>> [  142.438377] ath10k_pci 0000:01:00.0: firmware crashed! (uuid 
>> a5499582-e220-46d2-9359-0b44219f69ea)
>> [  142.447512] ath10k_pci 0000:01:00.0: qca988x hw2.0 target 0x4100016c 
>> chip_id 0x043202ff sub 0000:0000
>> [  142.456879] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 
>> tracing 0 dfs 1 testmode 1
>> [  142.469916] ath10k_pci 0000:01:00.0: firmware ver 10.2.4.70.54 api 5 
features no-p2p,raw-mode,mfp crc32 9d340dd9
>> [  142.480295] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A 
>> crc32 bebc7c08
>> [  142.487717] ath10k_pci 0000:01:00.0: htt-ver 2.1 wmi-op 5 htt-op 2 
>> cal file max-sta 128 raw 0 hwcrypto 1
>> [  142.499361] ath10k_pci 0000:01:00.0: firmware register dump:
>> [  142.505124] ath10k_pci 0000:01:00.0: [00]: 0x4100016C 0x000015B3 
0x009A4577 0x00955B31

Benjamin, Thanks for the logs.
Quick questions to further debug the issue here,

1. Is this issue seen every time you start sending data traffic?
2. Issue seen with older firmwares? (FYR, http://linuxwireless.org/en/users/Drivers/ath10k/firmware/ )
3. Could you please share the dmesg from your device after enabling MAC and WMI logs in ath10k driver
	To enable debug logs please see http://linuxwireless.org/en/users/Drivers/ath10k/debug/	
4. Do you know what is the Number of Spatial Streams seen in mesh beacons and in mesh data packet?

Thanks,
Ashok
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
