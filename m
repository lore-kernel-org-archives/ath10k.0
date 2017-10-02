Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dzAKV-0006tr-PT
 for ath10k@lists.infradead.org; Mon, 02 Oct 2017 23:40:57 +0000
From: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Subject: Re: ath10k-regression in 4.14: Connections aborts with "failed to
 extract amsdu: -11"
Date: Mon, 2 Oct 2017 23:40:31 +0000
Message-ID: <46f918c5-b07d-e397-2f3d-8136c7c1a8f3@qti.qualcomm.com>
References: <5a4860eb-3734-7587-d81f-9c3de6ff11c8@leemhuis.info>
In-Reply-To: <5a4860eb-3734-7587-d81f-9c3de6ff11c8@leemhuis.info>
Content-Language: en-US
Content-ID: <0CF7EC7F84DE2D4FA8B466607E8D1361@qualcomm.com>
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
To: Thorsten Leemhuis <linux@leemhuis.info>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 10/01/2017 01:59 AM, Thorsten Leemhuis wrote:

> Lo! The wifi connection of my Dell XPS13 (9360) with its QCA6174
> sometimes suddenly stops working since I switched to 4.14-rc2+. Every
> time it happens, there is this error message in dmesg:
>
>> ath10k_pci 0000:3a:00.0: failed to extract amsdu: -11
> I have to switch wifi off and on with the hotkey to reconnect. I can
> trigger the aborts by starting a big download and waiting a few minutes.
> Sometimes the connections aborts during normal load. Installing the
> latest firmware didn't help. The wifi works just fine with 4.13.3. While
> investigating this I noticed a few messages in dmesg that only appear in
> 4.14-rc (I used 35dbba31be52):

You do run the 4.13.3 v.s 4.14-rc with the same QCA6174 firmwrae, right?
Just want to understand the test setup here so that I could give it a try myself, and in 11ac or 11n mode you're testing?

>> ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/pre-cal-pci-0000:3a:00.0.bin failed with error -2
>> ath10k_pci 0000:3a:00.0: Direct firmware load for ath10k/cal-pci-0000:3a:00.0.bin failed with error -2
> Do they have anything to do with this? Hardware is

This error message is confusing since QCA6174 is not supporting pre-calibration feature, this reminds me that we need to clean this up.

>> 3a:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wireless Network Adapter [168c:003e] (rev 32)
> Wifi Firmware:
>
>> firmware ver WLAN.RM.4.4.1-00026-QCARMSWP-1 api 6 features wowlan,ignore-otp,raw-mode crc32 7b90c3fc
>> board_file api 2 bmi_id N/A crc32 414716a3
> Should I try to bisect this or is this issue already known? Side note
> FYI: I also updated the BIOS of the XPS13 recently (but there is a newer
> one available that I haven't installed yet) and switched to a newer
> Fedora version, but that afaics hasn't anything to do with this, as 4.13
> works just fine (famous last words...)

I am not aware of this failure, so since you've setup that is easy to reproduce the case.
Would you mind do a bisect to locate the failure, please?

Also before you're trying to bisect the kernel change, can you also give it a try to roll back to older firmwares or move to the latest one *WLAN.RM.4.4.1-00051-QCARMSWP-1***to isolate if this is a firmware issue.

-- 
Ryan Hsu

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
