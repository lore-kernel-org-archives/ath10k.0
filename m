Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLrpN-0007wd-7Z
 for ath10k@lists.infradead.org; Thu, 24 May 2018 15:07:04 +0000
Received: by mail-io0-x243.google.com with SMTP id g1-v6so2691130iob.2
 for <ath10k@lists.infradead.org>; Thu, 24 May 2018 08:06:42 -0700 (PDT)
Received: from hash (CPE30b5c2fb365b-CM18593342f28f.cpe.net.cable.rogers.com.
 [99.232.51.173])
 by smtp.gmail.com with ESMTPSA id v127-v6sm5809927itc.3.2018.05.24.08.06.40
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 May 2018 08:06:41 -0700 (PDT)
Received: from bob by hash with local (Exim 4.89)
 (envelope-from <me@bobcopeland.com>) id 1fLrpA-0003Ml-5p
 for ath10k@lists.infradead.org; Thu, 24 May 2018 11:06:40 -0400
Date: Thu, 24 May 2018 11:06:40 -0400
From: Bob Copeland <me@bobcopeland.com>
Subject: firmware dump, any hints?
Message-ID: <20180524150639.agz6kj44zfxrxlji@localhost>
MIME-Version: 1.0
Content-Disposition: inline
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
To: ath10k@lists.infradead.org

Hi folks,

I'm seeing this crash happen periodically.  This exact trace happens
some 30 times more often than other firmware crashes I have seen, yet
it is still rare enough that I haven't been able to pin down a root
cause.  Is there anyone out there with the toolchain and debuginfo that
could decode it for me?  Even to the level of "firmware is doing xyz
at the time" would be super helpful in coming up with a reproducer.

This happens while device is handling traffic but I have no other useful
context at the moment -- e.g. there's nothing at all before it in dmesg.

<3>[ 6180.341935] ath10k_pci 0000:01:00.0: firmware crashed! (uuid 2f665eec-ffd2-4f0e-8eef-fb6c8e95de87)
<6>[ 6180.341988] ath10k_pci 0000:01:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id 0x00000000 sub 168c:cafe
<6>[ 6180.349885] ath10k_pci 0000:01:00.0: kconfig debug 1 debugfs 1 tracing 1 dfs 0 testmode 0
<6>[ 6180.362883] ath10k_pci 0000:01:00.0: firmware ver 10.4-3.4-00104 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast crc32 4317698a
<6>[ 6180.368622] ath10k_pci 0000:01:00.0: board_file api 2 bmi_id 0:1 crc32 751efba1
<6>[ 6180.381366] ath10k_pci 0000:01:00.0: htt-ver 2.2 wmi-op 6 htt-op 4 cal pre-cal-file max-sta 512 raw 0 hwcrypto 1
<3>[ 6180.390700] ath10k_pci 0000:01:00.0: firmware register dump:
<3>[ 6180.399075] ath10k_pci 0000:01:00.0: [00]: 0x0000000A 0x000015B3 0x009B1CF8 0x00975B31
<3>[ 6180.404654] ath10k_pci 0000:01:00.0: [04]: 0x009B1CF8 0x00060130 0x00000020 0x00000000
<3>[ 6180.412445] ath10k_pci 0000:01:00.0: [08]: 0x00423EC4 0x00000000 0x00428440 0x00000001
<3>[ 6180.420349] ath10k_pci 0000:01:00.0: [12]: 0x00000009 0x00000000 0x00963BAD 0x00963BBF
<3>[ 6180.428253] ath10k_pci 0000:01:00.0: [16]: 0x00973AB0 0x009606CA 0x009606CA 0x00000000
<3>[ 6180.436078] ath10k_pci 0000:01:00.0: [20]: 0x409B1CF8 0x004068DC 0x004240E8 0x004166F4
<3>[ 6180.444060] ath10k_pci 0000:01:00.0: [24]: 0x809B2BFE 0x0040693C 0x00000000 0xC09B1CF8
<3>[ 6180.451934] ath10k_pci 0000:01:00.0: [28]: 0x809B233B 0x0040695C 0x00406980 0x00423EC4
<3>[ 6180.459837] ath10k_pci 0000:01:00.0: [32]: 0x8096EE0E 0x0040697C 0x00428450 0x00000001
<3>[ 6180.467740] ath10k_pci 0000:01:00.0: [36]: 0x8096F883 0x00406A2C 0x0042D52C 0x00424544
<3>[ 6180.475573] ath10k_pci 0000:01:00.0: [40]: 0x80963A26 0x00406A4C 0x0042D52C 0x00405528
<3>[ 6180.483580] ath10k_pci 0000:01:00.0: [44]: 0x80960E80 0x00406A9C 0x0000000E 0x00400000
<3>[ 6180.491456] ath10k_pci 0000:01:00.0: [48]: 0x80960E51 0x00406ACC 0x00400000 0x00000000
<3>[ 6180.499357] ath10k_pci 0000:01:00.0: [52]: 0x80960E9D 0x00406AEC 0x00000000 0x00400600
<3>[ 6180.507230] ath10k_pci 0000:01:00.0: [56]: 0x40960024 0x00406B0C 0x00403D08 0x00403D08

-- 
Bob Copeland %% https://bobcopeland.com/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
