Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from bay004-omc2s27.hotmail.com ([65.54.190.102])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSIhU-00078m-SJ
 for ath10k@lists.infradead.org; Wed, 27 Jul 2016 06:52:17 +0000
Message-ID: <BAY176-W4727918833A034C84E740DB90F0@phx.gbl>
From: sudheer thota <sdhrtht@outlook.com>
Subject: RIFS packets missing on ath10k monitor
Date: Wed, 27 Jul 2016 12:21:56 +0530
In-Reply-To: <BAY176-W426C633D2FC24792734487B90F0@phx.gbl>
References: <20160614061728.570-1-rmanohar@qti.qualcomm.com>,
 <CA+BoTQkepLz55Vdr7OuMnPQPLKq_+vjZi=m2Y9rHLRgBZPsWOw@mail.gmail.com>,
 <1468941948774.87860@qti.qualcomm.com>,
 <CAJ-Vmon1duBNcWhjaNdANYFfd3hwQUYYHrmx7LRZvT-Ec2x1Cg@mail.gmail.com>,
 <578E5AFA.4000908@candelatech.com>,
 <CA+BoTQ=QMPUtY64ELCToZLcSrCPQdG=2Eg4FrsULeeDg9sFPYA@mail.gmail.com>,
 <CAJ-Vmok95tiLzmnfiBnnOLQK9hXW2DfjPPVGy9yqucq32PBwJw@mail.gmail.com>,
 <CA+BoTQ=ehuXpcJUOeSscLKzX9T=hZyp5i2G9GoxTVX=LAg_4hA@mail.gmail.com>,
 <CAJ-Vmo=d=PgUu_AYT1C82AJcnUxKUo_VYMn_b1QF8M_T+5KpkA@mail.gmail.com>,
 <CA+BoTQnN1EVGBu0J5Y7-z2=uqsG8rXS0Lvs7VAoeawv9MGuFyQ@mail.gmail.com>,
 <b1cdb5c3-6ddb-8a69-d0f7-79d8e6ba23d0@dd-wrt.com>,
 <CA+BoTQmrk_U8oVXxk-5hBz60=R-xR4H=2_x2pj9BVDYXPOoCGg@mail.gmail.com>,
 <6487f1d3-339e-a6dd-d866-b11b37b4ddff@dd-wrt.com>,
 <73ce025f-c583-a747-ee9a-91bbfba56ff4@dd-wrt.com>,
 <579625AC.107@candelatech.com>,
 <6234373a-8ad9-1aec-032e-6e07b1510ef4@dd-wrt.com>,
 <CAJ-Vmomr7DSCEA0-i3p=tc=Kh0xCQ-gK20_c7L_=WSTQ4PLRVw@mail.gmail.com>,
 <BAY176-W27264163A549F
 , , 6C69777EFB60D0@phx.gbl>, <BAY176-W46EDDEDEC0C0573E68A47DB90E0@phx.gbl>,
 <CA+BoTQktJXJ+_oODypMfo7fhuA4+RSo1A5DoOYvWGBN=5HB9eQ@mail.gmail.com>,
 <BAY176-W43827D0BC3AF9D12C5E82DB90E0@phx.gbl>,
 <BAY176-W426C633D2FC24792734487B90F0@phx.gbl>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Came across a scenario where ath10k monitor fails to capture QOS data=A0pac=
kets (N900 router and Roku).=A0

observed these packets are with "RIFS=A0permitted" flag set along with "Gre=
enfield mode enabled".=A0

as the RIFS=A0is obsolete in AC specification, Is it possible for ath10k dr=
iver to=A0capture N packets with RIFS? or=A0

is it possible to enable this mode=A0through command line on ath10k driver =
to capture these packets.=A0 		 	   		  =

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
