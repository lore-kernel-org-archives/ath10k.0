Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXS20-00060k-4x
 for ath10k@lists.infradead.org; Thu, 13 Dec 2018 14:32:05 +0000
Subject: Re: [Ath10k] QCA9377-based USB dongle for aeronautical research
 project
References: <MW2PR12MB245884F0E7E54C559559A5E2F8A00@MW2PR12MB2458.namprd12.prod.outlook.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <93a9fc73-aeff-ae69-a927-a6e03f73ebad@candelatech.com>
Date: Thu, 13 Dec 2018 06:31:41 -0800
MIME-Version: 1.0
In-Reply-To: <MW2PR12MB245884F0E7E54C559559A5E2F8A00@MW2PR12MB2458.namprd12.prod.outlook.com>
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
To: Vincent Guenat <vincent.guenat@zii.aero>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, =?UTF-8?Q?Oliver_L=c3=bccke?= <oliver.luecke@zii.aero>



On 12/13/2018 01:01 AM, Vincent Guenat wrote:
> Dear Mr. Greear,
>
> I come to you to ask for directions. TRIAGNOSYS Gmbh, a division of Zodiac Inflight Innovations part of the SAFRAN GROUP, participate in a research project for the ARINC CSS committee aiming at investigating the potential use of 5 GHz DFS channels in aircrafts. In order to do that, the partners in this project aim to gather information about where radar interference occurs and on which channels by monitoring DFS channels during commercial flights. Partners including AIRBUS and DELTA AIRLINES have already provided their support.
>
> In order to monitor the DFS channels, a device based on WiFi dongles to be installed on planes is currently explored. The Linksys WUSB6100M device based on QCA9377 seems a promising choice, especially given the features proposed by the ath10k driver. The idea is to put this device in monitor mode and use the DFS pattern detector to report DFS events to userspace through cfg80211_radar_event/nl80211_radar_notify. This would require some modification in kernelspace so that the device does not switch channel upon radar detection. An application listening on a netlink socket would then retrieve the data. Therefore my question is: do you think this is possible?
>
> In the meantime, trying to use the Linksys device in STA mode does not work as the device does not manage to use DMA to allocate the tx buffer with dma_alloc_coherent in htt_tx.c. Given that it works for PCI devices, I assume that it is firmware-related but have not yet found a workaround. Do you have any ideas what might have caused this?
>
> Thank you for any time that you spend considering these questions.

Hello,

I do not have any access currently to the firmware for those devices, so it
would be hard to add any features or stability fixes or even understand
current bugs.

With PCI based ath10k devices in AP mode, there is a feature in the driver
that can disable channel switching on radar detection, and I recently
added support for querying more details for these radar events through
the debugfs API to my ath10k-ct driver.

I am not sure radar detection works in monitor mode, but possibly it does.

I recently did a test with some realtek USB NICs and was pleasantly surprised
with performance and stability in station mode.  Possibly it would work for your
test case.  The driver is out-of-kernel...this is the one I was using and I got it
compiling against openwrt without a few tweaks:

https://github.com/greearb/rtl8812AU_8821AU_linux

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
