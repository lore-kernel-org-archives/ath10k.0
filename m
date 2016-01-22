Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMcwD-0003Wt-Bl
 for ath10k@lists.infradead.org; Fri, 22 Jan 2016 14:43:45 +0000
Message-ID: <56A2400A.6060209@candelatech.com>
Date: Fri, 22 Jan 2016 06:43:22 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: 5GHz AP on a QCA988x
References: <CANCHnQoi_PiQC=Y2H_5eotKG1g9La1=Sxcob2C2cww-MfX8QYQ@mail.gmail.com>
 <CA+BoTQ=+R_URXt6-n=9+HPs7fBg5FszCLVDxosfsQ9DQ78QNUg@mail.gmail.com>
 <CANCHnQr1y0wVuzqpBnoUcCXD-WGnw_D0W5vE7ba39eALSas6Ew@mail.gmail.com>
 <CA+BoTQ=p9A3kDL1qWekaKMHX4GVeLZmGat0Y3k-78Tzkvf_Urg@mail.gmail.com>
 <CANCHnQrupReimOceW04uZrexiXDL7F8+MN6sO7NNh5zgkGvUEg@mail.gmail.com>
In-Reply-To: <CANCHnQrupReimOceW04uZrexiXDL7F8+MN6sO7NNh5zgkGvUEg@mail.gmail.com>
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
To: Jeroen Roovers <jeroen.roovers@airfi.aero>, Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 01/22/2016 02:11 AM, Jeroen Roovers wrote:
> So I would somehow need to fix the EEPROM, then? :)

You just need to hack the driver to change the regulatory domain.  You do not
need to muck with the firmware or eeprom or anything like that.

http://dmz2.candelatech.com/?p=linux-4.0.dev.y/.git;a=commitdiff;h=6f8337e5380a59fe498cea96d096bef4c60b4201;hp=f936faa45dc793704ff35f135473f1c390054f4d

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
