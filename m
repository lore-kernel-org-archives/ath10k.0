Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bG4FR-0000Lt-Vq
 for ath10k@lists.infradead.org; Thu, 23 Jun 2016 13:00:48 +0000
Received: by mail-qk0-x231.google.com with SMTP id a186so105440977qkf.0
 for <ath10k@lists.infradead.org>; Thu, 23 Jun 2016 06:00:25 -0700 (PDT)
From: Tom Marble <tmarble@info9.net>
Subject: Re: Cannot initialize Compex WLE600VX for 802.11ac?
In-Reply-To: <87r3bpfh94.fsf@kamboji.qca.qualcomm.com>
References: <57dtwgmmwmr.fsf@cerise.info9.net>
 <87y45xiuts.fsf@kamboji.qca.qualcomm.com> <57dd1n9mks5.fsf@cerise.info9.net>
 <87r3bpfh94.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 23 Jun 2016 08:00:21 -0500
Message-ID: <57doa6skql6.fsf@cerise.info9.net>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: Tom Marble <tmarble@info9.net>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

"Valo, Kalle" <kvalo@qca.qualcomm.com> writes:
> Tom Marble <tmarble@info9.net> writes:
>> "Valo, Kalle" <kvalo@qca.qualcomm.com> writes:
>>> Do you have CONFIG_ATH10K_DFS_CERTIFIED enabled?
>>
>> No.. the option isn't even commented out in my .config??
>
> It depends on CFG80211_CERTIFICATION_ONUS so you need to enable that
> first.

Okay, I've rebuild the kernel with that option. Here's the latest info:

root@six:/# uname -a
Linux six 4.7.0-rc3-wt-ath-tm2 #4 SMP Wed Jun 22 11:47:12 CDT 2016 x86_64 GNU/Linux
root@six:/# iw reg get
country US: DFS-FCC
        (2402 - 2472 @ 40), (N/A, 30), (N/A)
        (5170 - 5250 @ 80), (N/A, 17), (N/A)
        (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS
        (5735 - 5835 @ 80), (N/A, 30), (N/A)
        (57240 - 63720 @ 2160), (N/A, 40), (N/A)
root@six:/# iw phy0 info
  SEE http://paste.debian.net/747986/ 

Setting channel=0 to enable scanning results still fails
# hostapd -dd /etc/hostapd/wlan0.conf | tee /tmp/wlan0.log 
  SEE http://paste.debian.net/747988/

  nl80211: Failed to set fragmentation threshold 2346: -95 (Operation not supported)
  Could not set fragmentation threshold for kernel driver
  Interface initialization failed

Seems to have made it a little further... What should I try now?

--Tom


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
