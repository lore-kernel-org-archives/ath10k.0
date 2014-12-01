Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XvVEj-0002S5-IS
 for ath10k@lists.infradead.org; Mon, 01 Dec 2014 17:58:14 +0000
Message-ID: <547CAC1E.2000709@candelatech.com>
Date: Mon, 01 Dec 2014 09:57:50 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: IBSS mode is now supported by CT firmware.
References: <547525D4.5080701@candelatech.com>
 <CAD1M061uAfCfCnnVY1bh6kCcXXZhwOOiyww5mkU8VkxGov9DwA@mail.gmail.com>
 <CAEFj986B15pFo2WY_2x0VwEXBEBy+j0-nff2-B=Ff=qP66iP_w@mail.gmail.com>
 <CAEFj987HmrPz1vsjmckURuC4ZYT2h6MgBT6K3yQTWy3U5s+ZtQ@mail.gmail.com>
 <5478A2B2.3090402@candelatech.com>
 <CAD1M060=TLNR-ZFdTiwq8tAbC=2h2zsKbxyFkkL1N5pvfwLWEA@mail.gmail.com>
In-Reply-To: <CAD1M060=TLNR-ZFdTiwq8tAbC=2h2zsKbxyFkkL1N5pvfwLWEA@mail.gmail.com>
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
To: Pushpal Sidhu <psidhu@gateworks.com>
Cc: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 12/01/2014 09:38 AM, Pushpal Sidhu wrote:
> On Fri, Nov 28, 2014 at 8:28 AM, Ben Greear <greearb@candelatech.com> wrote:
>> Do you have any reason to believe the problem is in the driver or mac80211
>> stack, or is this all a firmware issue?
> Because the rate control logic is embedded in the firmware (I believe
> this is the reason why we don't have a nice 'rc_stats' table) seems to
> point to a firmware issue.
> 
>> And, if anyone has a different /AC NIC that can do IBSS, I'm curious
>> if ath10k will receive at higher speeds?
> So I just created an adhoc network with an ath9k radio (HT40+) with an
> ath10k radio (with HT40+) and found that the ath9k stayed at HT40/SGI
> MCS7. Checking on the ath10k, I found the same rate (150mbps) was
> being used.
> 
> A very interesting note, however, is that realistic transfer rates are
> 27mbps TCP, 37mbps UDP from ath9k->ath10k. ath10k->ath9k has realistic
> transfer rates of 4.17mbps TCP, 5.18mbps UDP and rates go back to the
> 6mbps we see earlier.

It may be a bit before I can get back to working on this effort,
but I am reading the email and it will help me when I do have time
to work on this again.

If you have time, can you see if you can get encryption working with
ath9k to ath9k?  I could not get that working, and I am not sure if
it is my supplicant setup or if I have some other bugs somewhere...

Please post config files if you do get it working.

And, what is ath9k to ath9k transfer rates?

Thanks,
Ben

> 
> - Pushpal
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
