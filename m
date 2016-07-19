Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from esa1.dell-outbound.iphmx.com ([68.232.153.90])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPRZs-0008Ld-Ni
 for ath10k@lists.infradead.org; Tue, 19 Jul 2016 09:44:37 +0000
From: <Perry_Yuan@Dell.com>
Date: Tue, 19 Jul 2016 17:41:41 +0800
Subject: RE: ath10k fail to load firmware
Message-ID: <A3D794F1192BBF449DF2EC3D7EE263F44A5402F143@SHAX7MCDC101.APAC.DELL.COM>
References: <20160719070932.GA2751@redhat.com>
 <CA+BoTQn98UFuGT0NntdE1HgG9UmmwzS=JsGkLmeGoMHSFGyDRg@mail.gmail.com>
 <20160719072754.GB2751@redhat.com>
 <A3D794F1192BBF449DF2EC3D7EE263F44A5402F0C8@SHAX7MCDC101.APAC.DELL.COM>
 <CA+BoTQn4T+4zMrJEbLBfu92w=mVqWBZZkZaYaW__V2_-VLkCyQ@mail.gmail.com>
 <A3D794F1192BBF449DF2EC3D7EE263F44A5402F107@SHAX7MCDC101.APAC.DELL.COM>
 <CA+BoTQk7QKaO2yxMq5JEhrBhn4WtpmWTcOxfiXcvYxrFvaxdgw@mail.gmail.com>
 <20160719092727.GD2751@redhat.com>
In-Reply-To: <20160719092727.GD2751@redhat.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: sgruszka@redhat.com, michal.kazior@tieto.com
Cc: kvalo@qca.qualcomm.com, Yijun_Shen@Dell.com, ath10k@lists.infradead.org

Dell - Internal Use - Confidential =


Yeah , I  provide the logs from two system .  but I don't   notice the  wir=
eless card system ID is different .
In my opinion . even the subsystem ID is not same . at least one wireless c=
ar should work well . =

The two cards all not working with current firmware .

So  could you tell me how to make it available  ?


keep up the good work
Perry=A0 Yuan
Dell | Client Software Group | Platform Sftwr Senior Engineer
office +86 21 22030689, mobile +86 18521512823
perry_yuan@dell.com
Please consider the environment before printing this email.


-----Original Message-----
From: Stanislaw Gruszka [mailto:sgruszka@redhat.com] =

Sent: Tuesday, July 19, 2016 5:27 PM
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Yuan, Perry <Perry_Yuan@Dell.com>; Kalle Valo <kvalo@qca.qualcomm.com>;=
 ath10k@lists.infradead.org; Shen, Yijun <Yijun_Shen@Dell.com>
Subject: Re: ath10k fail to load firmware

On Tue, Jul 19, 2016 at 11:17:03AM +0200, Michal Kazior wrote:
> On 19 July 2016 at 11:02,  <Perry_Yuan@dell.com> wrote:
> > Dell - Internal Use - Confidential
> >
> > I rename the bin file  . and capture new full logs from booting to firm=
ware error .
> > The error still happened. Please help to check it .
> > I want to know whether the new firmware bin are updated  the right one =
 in this git ?
> > If the firmware is good , the errors should be gone .

Please use reply-to-all, so I could see messages. You can drop ML eventuall=
y if you thing your data is confidential.

> Thanks for checking!
> =

> Apparently the available board-2.bin doesn't contain any subsystem
> vendor=3D1028 board data (just checked).
> =

> Also, you guys (i.e. Perry & Stanislaw) seem to be using 2 slightly =

> different devices. One reports its subsystem ids as 1028:0310 (in the =

> original log Stanislaw provided) and 1028:0410 (found in logs attached =

> by Perry).

I provided dmesg, which I get from Perry, hence seems that Perry tests on 2=
 different devices :-)

Stanislaw =


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
