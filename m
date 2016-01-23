Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x22c.google.com ([2607:f8b0:4003:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMm8a-0004oo-Kj
 for ath10k@lists.infradead.org; Sat, 23 Jan 2016 00:33:12 +0000
Received: by mail-ob0-x22c.google.com with SMTP id is5so76389366obc.0
 for <ath10k@lists.infradead.org>; Fri, 22 Jan 2016 16:32:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CANCHnQqTXtjbuGtZHFLCEn4K+u+bqyKzEOL5DvSPSSZiPT04Xg@mail.gmail.com>
References: <CANCHnQoZJ2Oy7VdCCe-Lv=V0Z_yp86m2z4anG-G=QbZxi69suA@mail.gmail.com>
 <CANCHnQp5yF9O3Wo72-FJjDVYFouPj-YoXt+6RmLWTvYavomvMg@mail.gmail.com>
 <CANCHnQryCaT9-qVfVrGO8Y8=cK_4pxbBArtfRQewp_gYA7hMHQ@mail.gmail.com>
 <20160122125155.GI14453@localhost>
 <CANCHnQqTXtjbuGtZHFLCEn4K+u+bqyKzEOL5DvSPSSZiPT04Xg@mail.gmail.com>
Date: Sat, 23 Jan 2016 08:32:45 +0800
Message-ID: <CAEFj985BS=nOvBePEzMd-2LZAs37z=rnvBH1httesefEUsr5ZQ@mail.gmail.com>
Subject: Re: Mesh on ath10k drops all packets
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Jeroen Roovers <jeroen.roovers@airfi.aero>
Cc: Bob Copeland <me@bobcopeland.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, Jan 22, 2016 at 11:45 PM, Jeroen Roovers
<jeroen.roovers@airfi.aero> wrote:
> On 22 January 2016 at 13:51, Bob Copeland <me@bobcopeland.com> wrote:
>> On Fri, Jan 22, 2016 at 12:01:36PM +0100, Jeroen Roovers wrote:
>>> Maybe related?
>>
>> Could be.
>
> [..]
>
>> What happens with non-secure mesh, i.e.:
>>
>> user_mpm=1
>> network={
>>     mode=5
>>     ssid="_"
>>     frequency=2412
>>     key_mgmt=NONE
>> }
>
> That works fine!
>

802.11ac or ath10k should only work on 5GHz, right?

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
