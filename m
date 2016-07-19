Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPRJx-000880-8h
 for ath10k@lists.infradead.org; Tue, 19 Jul 2016 09:28:09 +0000
Date: Tue, 19 Jul 2016 11:27:27 +0200
From: Stanislaw Gruszka <sgruszka@redhat.com>
Subject: Re: ath10k fail to load firmware
Message-ID: <20160719092727.GD2751@redhat.com>
References: <20160719070932.GA2751@redhat.com>
 <CA+BoTQn98UFuGT0NntdE1HgG9UmmwzS=JsGkLmeGoMHSFGyDRg@mail.gmail.com>
 <20160719072754.GB2751@redhat.com>
 <A3D794F1192BBF449DF2EC3D7EE263F44A5402F0C8@SHAX7MCDC101.APAC.DELL.COM>
 <CA+BoTQn4T+4zMrJEbLBfu92w=mVqWBZZkZaYaW__V2_-VLkCyQ@mail.gmail.com>
 <A3D794F1192BBF449DF2EC3D7EE263F44A5402F107@SHAX7MCDC101.APAC.DELL.COM>
 <CA+BoTQk7QKaO2yxMq5JEhrBhn4WtpmWTcOxfiXcvYxrFvaxdgw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+BoTQk7QKaO2yxMq5JEhrBhn4WtpmWTcOxfiXcvYxrFvaxdgw@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, Yijun_Shen@dell.com, Perry_Yuan@dell.com, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tue, Jul 19, 2016 at 11:17:03AM +0200, Michal Kazior wrote:
> On 19 July 2016 at 11:02,  <Perry_Yuan@dell.com> wrote:
> > Dell - Internal Use - Confidential
> >
> > I rename the bin file  . and capture new full logs from booting to firmware error .
> > The error still happened. Please help to check it .
> > I want to know whether the new firmware bin are updated  the right one  in this git ?
> > If the firmware is good , the errors should be gone .

Please use reply-to-all, so I could see messages. You can drop ML
eventually if you thing your data is confidential.

> Thanks for checking!
> 
> Apparently the available board-2.bin doesn't contain any subsystem
> vendor=1028 board data (just checked).
> 
> Also, you guys (i.e. Perry & Stanislaw) seem to be using 2 slightly
> different devices. One reports its subsystem ids as 1028:0310 (in the
> original log Stanislaw provided) and 1028:0410 (found in logs attached
> by Perry).

I provided dmesg, which I get from Perry, hence seems that Perry tests
on 2 different devices :-)

Stanislaw 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
